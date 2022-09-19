#define STANDARD
#ifdef PHYSICAL
	#define IOR
	#define SPECULAR
#endif
uniform vec3 diffuse;
uniform vec3 emissive;
uniform float roughness;
uniform float metalness;
uniform float opacity;
#ifdef IOR
	uniform float ior;
#endif
#ifdef SPECULAR
	uniform float specularIntensity;
	uniform vec3 specularColor;
	#ifdef USE_SPECULARINTENSITYMAP
		uniform sampler2D specularIntensityMap;
	#endif
	#ifdef USE_SPECULARCOLORMAP
		uniform sampler2D specularColorMap;
	#endif
#endif
#ifdef USE_CLEARCOAT
	uniform float clearcoat;
	uniform float clearcoatRoughness;
#endif
#ifdef USE_IRIDESCENCE
	uniform float iridescence;
	uniform float iridescenceIOR;
	uniform float iridescenceThicknessMinimum;
	uniform float iridescenceThicknessMaximum;
#endif
#ifdef USE_SHEEN
	uniform vec3 sheenColor;
	uniform float sheenRoughness;
	#ifdef USE_SHEENCOLORMAP
		uniform sampler2D sheenColorMap;
	#endif
	#ifdef USE_SHEENROUGHNESSMAP
		uniform sampler2D sheenRoughnessMap;
	#endif
#endif
varying vec3 vViewPosition;
#include <common>



// /bg/MAT/meshStandardBuilder1/rgbToOklab3
//////////////////////////////////////////////////////////////////////
//
// Visualizing Björn Ottosson's "oklab" colorspace
//
// shadertoy implementation by mattz
//
// license CC0 (public domain)
// https://creativecommons.org/share-your-work/public-domain/cc0/
//
// Click and drag to set lightness (mouse x) and chroma (mouse y).
// Hue varies linearly across the image from left to right.
//
// While mouse is down, plotted curves show oklab components
// L (red), a (green), and b (blue). 
//
// To test the inverse mapping, the plotted curves are generated
// by mapping the (pre-clipping) linear RGB color back to oklab 
// space.
//
// White bars on top of the image (and black bars on the bottom of
// the image) indicate clipping when one or more of the R, G, B 
// components are greater than 1.0 (or less than 0.0 respectively).
//
// The color accompanying the black/white bar shows which channels
// are out of gamut.
//
// Click in the bottom left to reset the view.
//
// Hit the 'G' key to toggle displaying a gamut test:
//
//   * black pixels indicate that RGB values for some hues
//     were clipped to 0 at the given lightness/chroma pair.
//
//   * white pixels indicate that RGB values for some hues
//     were clipped to 1 at the given lightness/chroma pair
//
//   * gray pixels indicate that both types of clipping happened
//
// Hit the 'U' key to display a uniform sampling of linear sRGB 
// space, converted into oklab lightness (x position) and chroma
// (y position) coordinates. If you mouse over a colored dot, the
// spectrum on screen should include that exact color.
//
//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////
// sRGB color transform and inverse from 
// https://bottosson.github.io/posts/colorwrong/#what-can-we-do%3F

vec3 srgb_from_linear_srgb(vec3 x) {

    vec3 xlo = 12.92*x;
    vec3 xhi = 1.055 * pow(x, vec3(0.4166666666666667)) - 0.055;
    
    return mix(xlo, xhi, step(vec3(0.0031308), x));

}

vec3 linear_srgb_from_srgb(vec3 x) {

    vec3 xlo = x / 12.92;
    vec3 xhi = pow((x + 0.055)/(1.055), vec3(2.4));
    
    return mix(xlo, xhi, step(vec3(0.04045), x));

}

//////////////////////////////////////////////////////////////////////
// oklab transform and inverse from
// https://bottosson.github.io/posts/oklab/


const mat3 fwdA = mat3(1.0, 1.0, 1.0,
                       0.3963377774, -0.1055613458, -0.0894841775,
                       0.2158037573, -0.0638541728, -1.2914855480);
                       
const mat3 fwdB = mat3(4.0767245293, -1.2681437731, -0.0041119885,
                       -3.3072168827, 2.6093323231, -0.7034763098,
                       0.2307590544, -0.3411344290,  1.7068625689);

const mat3 invB = mat3(0.4121656120, 0.2118591070, 0.0883097947,
                       0.5362752080, 0.6807189584, 0.2818474174,
                       0.0514575653, 0.1074065790, 0.6302613616);
                       
const mat3 invA = mat3(0.2104542553, 1.9779984951, 0.0259040371,
                       0.7936177850, -2.4285922050, 0.7827717662,
                       -0.0040720468, 0.4505937099, -0.8086757660);

vec3 oklab_from_linear_srgb(vec3 c) {

    vec3 lms = invB * c;
            
    return invA * (sign(lms)*pow(abs(lms), vec3(0.3333333333333)));
    
}

vec3 linear_srgb_from_oklab(vec3 c) {

    vec3 lms = fwdA * c;
    
    return fwdB * (lms * lms * lms);
    
}


// https://www.shadertoy.com/view/WtccD7
const float max_chroma = 0.33;
vec3 uvToOklab(vec3 uvw){

    // setup oklab color
    float theta = 2.*3.141592653589793*uvw.x;
    
    float L = 0.8;
    float chroma = 0.1;
    
    //if (max(iMouse.x, iMouse.y) > 0.05 * iResolution.y) {
        L = uvw.y;//iMouse.x / iResolution.x;
        chroma = uvw.z * max_chroma;// / iResolution.y;
    //}
    
    float a = chroma*cos(theta);
    float b = chroma*sin(theta);
    
    vec3 lab = vec3(L, a, b);
	return lab;

    // convert to rgb 
    // vec3 rgb = linear_srgb_from_oklab(lab);

}

// /bg/MAT/meshStandardBuilder1/SDFBox2
// https://iquilezles.org/articles/distfunctions/

float dot2( in vec2 v ) { return dot(v,v); }
float dot2( in vec3 v ) { return dot(v,v); }
float ndot( in vec2 a, in vec2 b ) { return a.x*b.x - a.y*b.y; }
/*
*
* SDF PRIMITIVES
*
*/
float sdSphere( vec3 p, float s )
{
	return length(p)-s;
}

float sdBox( vec3 p, vec3 b )
{
	vec3 q = abs(p) - b;
	return length(max(q,0.0)) + min(max(q.x,max(q.y,q.z)),0.0);
}
float sdRoundBox( vec3 p, vec3 b, float r )
{
	vec3 q = abs(p) - b;
	return length(max(q,0.0)) + min(max(q.x,max(q.y,q.z)),0.0) - r;
}


float sdBoxFrame( vec3 p, vec3 b, float e )
{
		p = abs(p  )-b;
	vec3 q = abs(p+e)-e;
	return min(min(
		length(max(vec3(p.x,q.y,q.z),0.0))+min(max(p.x,max(q.y,q.z)),0.0),
		length(max(vec3(q.x,p.y,q.z),0.0))+min(max(q.x,max(p.y,q.z)),0.0)),
		length(max(vec3(q.x,q.y,p.z),0.0))+min(max(q.x,max(q.y,p.z)),0.0));
}
float sdCapsule( vec3 p, vec3 a, vec3 b, float r )
{
	vec3 pa = p - a, ba = b - a;
	float h = clamp( dot(pa,ba)/dot(ba,ba), 0.0, 1.0 );
	return length( pa - ba*h ) - r;
}
float sdVerticalCapsule( vec3 p, float h, float r )
{
	p.y -= clamp( p.y, 0.0, h );
	return length( p ) - r;
}
float sdCone( in vec3 p, in vec2 c, float h )
{
	// c is the sin/cos of the angle, h is height
	// Alternatively pass q instead of (c,h),
	// which is the point at the base in 2D
	vec2 q = h*vec2(c.x/c.y,-1.0);

	vec2 w = vec2( length(p.xz), p.y );
	vec2 a = w - q*clamp( dot(w,q)/dot(q,q), 0.0, 1.0 );
	vec2 b = w - q*vec2( clamp( w.x/q.x, 0.0, 1.0 ), 1.0 );
	float k = sign( q.y );
	float d = min(dot( a, a ),dot(b, b));
	float s = max( k*(w.x*q.y-w.y*q.x),k*(w.y-q.y)  );
	return sqrt(d)*sign(s);
}
float sdConeWrapped(vec3 pos, float angle, float height){
	return sdCone(pos, vec2(sin(angle), cos(angle)), height);
}
float sdRoundCone( vec3 p, float r1, float r2, float h )
{
	float b = (r1-r2)/h;
	float a = sqrt(1.0-b*b);

	vec2 q = vec2( length(p.xz), p.y );
	float k = dot(q,vec2(-b,a));
	if( k<0.0 ) return length(q) - r1;
	if( k>a*h ) return length(q-vec2(0.0,h)) - r2;
	return dot(q, vec2(a,b) ) - r1;
}

float sdPlane( vec3 p, vec3 n, float h )
{
	// n must be normalized
	return dot(p,n) + h;
}

float sdTorus( vec3 p, vec2 t )
{
	vec2 q = vec2(length(p.xz)-t.x,p.y);
	return length(q)-t.y;
}
float sdCappedTorus(in vec3 p, in vec2 sc, in float ra, in float rb)
{
	p.x = abs(p.x);
	float k = (sc.y*p.x>sc.x*p.y) ? dot(p.xy,sc) : length(p.xy);
	return sqrt( dot(p,p) + ra*ra - 2.0*ra*k ) - rb;
}
float sdLink( vec3 p, float le, float r1, float r2 )
{
  vec3 q = vec3( p.x, max(abs(p.y)-le,0.0), p.z );
  return length(vec2(length(q.xy)-r1,q.z)) - r2;
}
// c is the sin/cos of the desired cone angle
float sdSolidAngle(vec3 pos, vec2 c, float radius)
{
	vec2 p = vec2( length(pos.xz), pos.y );
	float l = length(p) - radius;
	float m = length(p - c*clamp(dot(p,c),0.0,radius) );
	return max(l,m*sign(c.y*p.x-c.x*p.y));
}
float sdSolidAngleWrapped(vec3 pos, float angle, float radius){
	return sdSolidAngle(pos, vec2(sin(angle), cos(angle)), radius);
}
float sdOctahedron( vec3 p, float s)
{
  p = abs(p);
  float m = p.x+p.y+p.z-s;
  vec3 q;
       if( 3.0*p.x < m ) q = p.xyz;
  else if( 3.0*p.y < m ) q = p.yzx;
  else if( 3.0*p.z < m ) q = p.zxy;
  else return m*0.57735027;
    
  float k = clamp(0.5*(q.z-q.y+s),0.0,s); 
  return length(vec3(q.x,q.y-s+k,q.z-k)); 
}

/*
*
* SDF OPERATIONS
*
*/
float SDFUnion( float d1, float d2 ) { return min(d1,d2); }
float SDFSubtract( float d1, float d2 ) { return max(-d1,d2); }
float SDFIntersect( float d1, float d2 ) { return max(d1,d2); }

float SDFSmoothUnion( float d1, float d2, float k ) {
	float h = clamp( 0.5 + 0.5*(d2-d1)/k, 0.0, 1.0 );
	return mix( d2, d1, h ) - k*h*(1.0-h);
}

float SDFSmoothSubtract( float d1, float d2, float k ) {
	float h = clamp( 0.5 - 0.5*(d2+d1)/k, 0.0, 1.0 );
	return mix( d2, -d1, h ) + k*h*(1.0-h);
}

float SDFSmoothIntersect( float d1, float d2, float k ) {
	float h = clamp( 0.5 - 0.5*(d2-d1)/k, 0.0, 1.0 );
	return mix( d2, d1, h ) + k*h*(1.0-h);
}

vec4 SDFElongateFast( in vec3 p, in vec3 h )
{
	return vec4( p-clamp(p,-h,h), 0.0 );
}
vec4 SDFElongateSlow( in vec3 p, in vec3 h )
{
	vec3 q = abs(p)-h;
	return vec4( max(q,0.0), min(max(q.x,max(q.y,q.z)),0.0) );
}

float SDFOnion( in float sdf, in float thickness )
{
	return abs(sdf)-thickness;
}

// /bg/MAT/meshStandardBuilder1/fit1
//
//
// FIT
//
//
float fit(float val, float srcMin, float srcMax, float destMin, float destMax){
	float src_range = srcMax - srcMin;
	float dest_range = destMax - destMin;

	float r = (val - srcMin) / src_range;
	return (r * dest_range) + destMin;
}
vec2 fit(vec2 val, vec2 srcMin, vec2 srcMax, vec2 destMin, vec2 destMax){
	return vec2(
		fit(val.x, srcMin.x, srcMax.x, destMin.x, destMax.x),
		fit(val.y, srcMin.y, srcMax.y, destMin.y, destMax.y)
	);
}
vec3 fit(vec3 val, vec3 srcMin, vec3 srcMax, vec3 destMin, vec3 destMax){
	return vec3(
		fit(val.x, srcMin.x, srcMax.x, destMin.x, destMax.x),
		fit(val.y, srcMin.y, srcMax.y, destMin.y, destMax.y),
		fit(val.z, srcMin.z, srcMax.z, destMin.z, destMax.z)
	);
}
vec4 fit(vec4 val, vec4 srcMin, vec4 srcMax, vec4 destMin, vec4 destMax){
	return vec4(
		fit(val.x, srcMin.x, srcMax.x, destMin.x, destMax.x),
		fit(val.y, srcMin.y, srcMax.y, destMin.y, destMax.y),
		fit(val.z, srcMin.z, srcMax.z, destMin.z, destMax.z),
		fit(val.w, srcMin.w, srcMax.w, destMin.w, destMax.w)
	);
}

//
//
// FIT TO 01
// fits the range [srcMin, srcMax] to [0, 1]
//
float fitTo01(float val, float srcMin, float srcMax){
	float size = srcMax - srcMin;
	return (val - srcMin) / size;
}
vec2 fitTo01(vec2 val, vec2 srcMin, vec2 srcMax){
	return vec2(
		fitTo01(val.x, srcMin.x, srcMax.x),
		fitTo01(val.y, srcMin.y, srcMax.y)
	);
}
vec3 fitTo01(vec3 val, vec3 srcMin, vec3 srcMax){
	return vec3(
		fitTo01(val.x, srcMin.x, srcMax.x),
		fitTo01(val.y, srcMin.y, srcMax.y),
		fitTo01(val.z, srcMin.z, srcMax.z)
	);
}
vec4 fitTo01(vec4 val, vec4 srcMin, vec4 srcMax){
	return vec4(
		fitTo01(val.x, srcMin.x, srcMax.x),
		fitTo01(val.y, srcMin.y, srcMax.y),
		fitTo01(val.z, srcMin.z, srcMax.z),
		fitTo01(val.w, srcMin.w, srcMax.w)
	);
}

//
//
// FIT FROM 01
// fits the range [0, 1] to [destMin, destMax]
//
float fitFrom01(float val, float destMin, float destMax){
	return fit(val, 0.0, 1.0, destMin, destMax);
}
vec2 fitFrom01(vec2 val, vec2 srcMin, vec2 srcMax){
	return vec2(
		fitFrom01(val.x, srcMin.x, srcMax.x),
		fitFrom01(val.y, srcMin.y, srcMax.y)
	);
}
vec3 fitFrom01(vec3 val, vec3 srcMin, vec3 srcMax){
	return vec3(
		fitFrom01(val.x, srcMin.x, srcMax.x),
		fitFrom01(val.y, srcMin.y, srcMax.y),
		fitFrom01(val.z, srcMin.z, srcMax.z)
	);
}
vec4 fitFrom01(vec4 val, vec4 srcMin, vec4 srcMax){
	return vec4(
		fitFrom01(val.x, srcMin.x, srcMax.x),
		fitFrom01(val.y, srcMin.y, srcMax.y),
		fitFrom01(val.z, srcMin.z, srcMax.z),
		fitFrom01(val.w, srcMin.w, srcMax.w)
	);
}

//
//
// FIT FROM 01 TO VARIANCE
// fits the range [0, 1] to [center - variance, center + variance]
//
float fitFrom01ToVariance(float val, float center, float variance){
	return fitFrom01(val, center - variance, center + variance);
}
vec2 fitFrom01ToVariance(vec2 val, vec2 center, vec2 variance){
	return vec2(
		fitFrom01ToVariance(val.x, center.x, variance.x),
		fitFrom01ToVariance(val.y, center.y, variance.y)
	);
}
vec3 fitFrom01ToVariance(vec3 val, vec3 center, vec3 variance){
	return vec3(
		fitFrom01ToVariance(val.x, center.x, variance.x),
		fitFrom01ToVariance(val.y, center.y, variance.y),
		fitFrom01ToVariance(val.z, center.z, variance.z)
	);
}
vec4 fitFrom01ToVariance(vec4 val, vec4 center, vec4 variance){
	return vec4(
		fitFrom01ToVariance(val.x, center.x, variance.x),
		fitFrom01ToVariance(val.y, center.y, variance.y),
		fitFrom01ToVariance(val.z, center.z, variance.z),
		fitFrom01ToVariance(val.w, center.w, variance.w)
	);
}

// /bg/MAT/meshStandardBuilder1/complement3
float complement(float x){return 1.0-x;}
vec2 complement(vec2 x){return vec2(1.0-x.x, 1.0-x.y);}
vec3 complement(vec3 x){return vec3(1.0-x.x, 1.0-x.y, 1.0-x.z);}
vec4 complement(vec4 x){return vec4(1.0-x.x, 1.0-x.y, 1.0-x.z, 1.0-x.w);}








// /bg/MAT/meshStandardBuilder1/param1
uniform vec3 v_POLY_param_blobPos;

// /bg/MAT/meshStandardBuilder1/globals1
varying vec3 v_POLY_globals1_position;




#include <packing>
#include <dithering_pars_fragment>
#include <color_pars_fragment>
#include <uv_pars_fragment>
#include <uv2_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <aomap_pars_fragment>
#include <lightmap_pars_fragment>
#include <emissivemap_pars_fragment>
#include <bsdfs>
#include <iridescence_fragment>
#include <cube_uv_reflection_fragment>
#include <envmap_common_pars_fragment>
#include <envmap_physical_pars_fragment>
#include <fog_pars_fragment>
#include <lights_pars_begin>
#include <normal_pars_fragment>
#include <lights_physical_pars_fragment>
#include <transmission_pars_fragment>
#include <shadowmap_pars_fragment>
#include <bumpmap_pars_fragment>
#include <normalmap_pars_fragment>
#include <clearcoat_pars_fragment>
#include <iridescence_pars_fragment>
#include <roughnessmap_pars_fragment>
#include <metalnessmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
struct SSSModel {
	bool isActive;
	vec3 color;
	float thickness;
	float power;
	float scale;
	float distortion;
	float ambient;
	float attenuation;
};

void RE_Direct_Scattering(
	const in IncidentLight directLight,
	const in GeometricContext geometry,
	const in SSSModel sssModel,
	inout ReflectedLight reflectedLight
	){
	vec3 scatteringHalf = normalize(directLight.direction + (geometry.normal * sssModel.distortion));
	float scatteringDot = pow(saturate(dot(geometry.viewDir, -scatteringHalf)), sssModel.power) * sssModel.scale;
	vec3 scatteringIllu = (scatteringDot + sssModel.ambient) * (sssModel.color * (1.0-sssModel.thickness));
	reflectedLight.directDiffuse += scatteringIllu * sssModel.attenuation * directLight.color;
}

void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( diffuse, opacity );



	// /bg/MAT/meshStandardBuilder1/constant4
	vec3 v_POLY_constant4_val = vec3(0.08235294117647059, 0.043137254901960784, 0.615686274509804);
	
	// /bg/MAT/meshStandardBuilder1/constant1
	vec3 v_POLY_constant1_val = vec3(0.8431372549019608, 0.09803921568627451, 0.09803921568627451);
	
	// /bg/MAT/meshStandardBuilder1/param1
	vec3 v_POLY_param1_val = v_POLY_param_blobPos;
	
	// /bg/MAT/meshStandardBuilder1/constant3
	float v_POLY_constant3_val = 14.0;
	
	// /bg/MAT/meshStandardBuilder1/constant2
	vec3 v_POLY_constant2_val = vec3(1.0, 1.0, 1.0);
	
	// /bg/MAT/meshStandardBuilder1/rgbToOklab3
	vec3 v_POLY_rgbToOklab3_oklab = oklab_from_linear_srgb(v_POLY_constant4_val);
	
	// /bg/MAT/meshStandardBuilder1/rgbToOklab1
	vec3 v_POLY_rgbToOklab1_oklab = oklab_from_linear_srgb(v_POLY_constant1_val);
	
	// /bg/MAT/meshStandardBuilder1/SDFBox2
	float v_POLY_SDFBox2_float = sdBox(v_POLY_globals1_position - vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0)*0.42);
	
	// /bg/MAT/meshStandardBuilder1/vec3ToFloat1
	float v_POLY_vec3ToFloat1_x = v_POLY_param1_val.x;
	float v_POLY_vec3ToFloat1_y = v_POLY_param1_val.y;
	
	// /bg/MAT/meshStandardBuilder1/multAdd1
	float v_POLY_multAdd1_val = (1.0*(v_POLY_vec3ToFloat1_y + -0.5)) + 0.0;
	
	// /bg/MAT/meshStandardBuilder1/floatToVec3_1
	vec3 v_POLY_floatToVec3_1_vec3 = vec3(v_POLY_vec3ToFloat1_x, v_POLY_multAdd1_val, 0.0);
	
	// /bg/MAT/meshStandardBuilder1/SDFSphere1
	float v_POLY_SDFSphere1_float = sdSphere(v_POLY_globals1_position - v_POLY_floatToVec3_1_vec3, 0.32999999999999996);
	
	// /bg/MAT/meshStandardBuilder1/SDFUnion2
	float v_POLY_SDFUnion2_union = SDFSmoothUnion(v_POLY_SDFSphere1_float, v_POLY_SDFBox2_float, 0.39);
	
	// /bg/MAT/meshStandardBuilder1/null1
	float v_POLY_null1_val = v_POLY_SDFUnion2_union;
	
	// /bg/MAT/meshStandardBuilder1/fit1
	float v_POLY_fit1_val = fit(v_POLY_null1_val, 0.0, 1.0, 0.0, 0.9);
	
	// /bg/MAT/meshStandardBuilder1/multAdd5
	float v_POLY_multAdd5_val = (1.0*(v_POLY_null1_val + -0.2)) + 0.0;
	
	// /bg/MAT/meshStandardBuilder1/complement3
	float v_POLY_complement3_val = complement(v_POLY_fit1_val);
	
	// /bg/MAT/meshStandardBuilder1/smoothstep4
	float v_POLY_smoothstep4_val = smoothstep(0.0, 0.01, v_POLY_multAdd5_val);
	
	// /bg/MAT/meshStandardBuilder1/mult3
	float v_POLY_mult3_product = (v_POLY_complement3_val * v_POLY_constant3_val * 1.0);
	
	// /bg/MAT/meshStandardBuilder1/round1
	float v_POLY_round1_val = sign(v_POLY_mult3_product)*floor(abs(v_POLY_mult3_product)+0.5);
	
	// /bg/MAT/meshStandardBuilder1/divide1
	float v_POLY_divide1_divide = (v_POLY_round1_val / v_POLY_constant3_val / 1.0);
	
	// /bg/MAT/meshStandardBuilder1/mix4
	vec3 v_POLY_mix4_mix = mix(v_POLY_rgbToOklab3_oklab, v_POLY_rgbToOklab1_oklab, v_POLY_divide1_divide);
	
	// /bg/MAT/meshStandardBuilder1/oklabToRgb1
	vec3 v_POLY_oklabToRgb1_rgb = linear_srgb_from_oklab(v_POLY_mix4_mix);
	
	// /bg/MAT/meshStandardBuilder1/mix1
	vec3 v_POLY_mix1_mix = mix(v_POLY_oklabToRgb1_rgb, v_POLY_constant2_val, v_POLY_smoothstep4_val);
	
	// /bg/MAT/meshStandardBuilder1/output1
	diffuseColor.xyz = v_POLY_mix1_mix;
	float POLY_metalness = 1.0;
	float POLY_roughness = 1.0;
	vec3 POLY_emissive = vec3(1.0, 1.0, 1.0);
	SSSModel POLY_SSSModel = SSSModel(/*isActive*/false,/*color*/vec3(1.0, 1.0, 1.0), /*thickness*/0.1, /*power*/2.0, /*scale*/16.0, /*distortion*/0.1,/*ambient*/0.4,/*attenuation*/0.8 );



	ReflectedLight reflectedLight = ReflectedLight( vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ) );
	vec3 totalEmissiveRadiance = emissive * POLY_emissive;
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <color_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	float roughnessFactor = roughness * POLY_roughness;

#ifdef USE_ROUGHNESSMAP

	vec4 texelRoughness = texture2D( roughnessMap, vUv );

	// reads channel G, compatible with a combined OcclusionRoughnessMetallic (RGB) texture
	roughnessFactor *= texelRoughness.g;

#endif

	float metalnessFactor = metalness * POLY_metalness;

#ifdef USE_METALNESSMAP

	vec4 texelMetalness = texture2D( metalnessMap, vUv );

	// reads channel B, compatible with a combined OcclusionRoughnessMetallic (RGB) texture
	metalnessFactor *= texelMetalness.b;

#endif

	#include <normal_fragment_begin>
	#include <normal_fragment_maps>
	#include <clearcoat_normal_fragment_begin>
	#include <clearcoat_normal_fragment_maps>
	#include <emissivemap_fragment>
	#include <lights_physical_fragment>
	#include <lights_fragment_begin>
if(POLY_SSSModel.isActive){
	RE_Direct_Scattering(directLight, geometry, POLY_SSSModel, reflectedLight);
}


	#include <lights_fragment_maps>
	#include <lights_fragment_end>
	#include <aomap_fragment>
	vec3 totalDiffuse = reflectedLight.directDiffuse + reflectedLight.indirectDiffuse;
	vec3 totalSpecular = reflectedLight.directSpecular + reflectedLight.indirectSpecular;
	#include <transmission_fragment>
	vec3 outgoingLight = totalDiffuse + totalSpecular + totalEmissiveRadiance;
	#ifdef USE_SHEEN
		float sheenEnergyComp = 1.0 - 0.157 * max3( material.sheenColor );
		outgoingLight = outgoingLight * sheenEnergyComp + sheenSpecular;
	#endif
	#ifdef USE_CLEARCOAT
		float dotNVcc = saturate( dot( geometry.clearcoatNormal, geometry.viewDir ) );
		vec3 Fcc = F_Schlick( material.clearcoatF0, material.clearcoatF90, dotNVcc );
		outgoingLight = outgoingLight * ( 1.0 - material.clearcoat * Fcc ) + clearcoatSpecular * material.clearcoat;
	#endif
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
	#include <dithering_fragment>
}