
// INSERT DEFINES

#define DISTANCE

uniform vec3 referencePosition;
uniform float nearDistance;
uniform float farDistance;
varying vec3 vWorldPosition;

#include <common>



// /bg/MAT/meshStandardBuilder1/disk1
float disk_feather(float dist, float radius, float feather){
	if(feather <= 0.0){
		if(dist < radius){return 1.0;}else{return 0.0;}
	} else {
		float half_feather = feather * 0.5;
		if(dist < (radius - half_feather)){
			return 1.0;
		} else {
			if(dist > (radius + half_feather)){
				return 0.0;
			} else {
				float feather_start = (radius - half_feather);
				float blend = 1.0 - (dist - feather_start) / feather;
				return blend;
			}
		}
	}
}

float disk2d(vec2 pos, vec2 center, float radius, float feather){
	float dist = distance(pos, center);
	return disk_feather(dist, radius, feather);
}

// function could be called sphere, but is an overload of disk, and is the same
float disk3d(vec3 pos, vec3 center, float radius, float feather){
	float dist = distance(pos, center);
	return disk_feather(dist, radius, feather);
}







// /bg/MAT/meshStandardBuilder1/globals1
varying vec3 v_POLY_globals1_position;




#include <packing>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
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

	vec4 diffuseColor = vec4( 1.0 );

	#include <map_fragment>
	#include <alphamap_fragment>



	// /bg/MAT/meshStandardBuilder1/constant2
	vec3 v_POLY_constant2_val = vec3(1.0, 1.0, 1.0);
	
	// /bg/MAT/meshStandardBuilder1/constant1
	vec3 v_POLY_constant1_val = vec3(0.8431372549019608, 0.09803921568627451, 0.09803921568627451);
	
	// /bg/MAT/meshStandardBuilder1/vec3ToFloat1
	float v_POLY_vec3ToFloat1_x = v_POLY_globals1_position.x;
	float v_POLY_vec3ToFloat1_y = v_POLY_globals1_position.y;
	
	// /bg/MAT/meshStandardBuilder1/floatToVec2_1
	vec2 v_POLY_floatToVec2_1_vec2 = vec2(v_POLY_vec3ToFloat1_x, v_POLY_vec3ToFloat1_y);
	
	// /bg/MAT/meshStandardBuilder1/disk1
	float v_POLY_disk1_float = disk2d(v_POLY_floatToVec2_1_vec2, vec2(0.0, 0.5), 1.0, 0.02);
	
	// /bg/MAT/meshStandardBuilder1/mix1
	vec3 v_POLY_mix1_mix = mix(v_POLY_constant2_val, v_POLY_constant1_val, v_POLY_disk1_float);
	
	// /bg/MAT/meshStandardBuilder1/output1
	diffuseColor.xyz = v_POLY_mix1_mix;
	float POLY_metalness = 1.0;
	float POLY_roughness = 1.0;
	vec3 POLY_emissive = vec3(1.0, 1.0, 1.0);
	SSSModel POLY_SSSModel = SSSModel(/*isActive*/false,/*color*/vec3(1.0, 1.0, 1.0), /*thickness*/0.1, /*power*/2.0, /*scale*/16.0, /*distortion*/0.1,/*ambient*/0.4,/*attenuation*/0.8 );




	// INSERT BODY

	#include <alphatest_fragment>

	float dist = length( vWorldPosition - referencePosition );
	dist = ( dist - nearDistance ) / ( farDistance - nearDistance );
	dist = saturate( dist ); // clamp to [ 0, 1 ]

	gl_FragColor = packDepthToRGBA( dist );

}
