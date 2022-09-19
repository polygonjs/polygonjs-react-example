
// INSERT DEFINES

#define DISTANCE

uniform vec3 referencePosition;
uniform float nearDistance;
uniform float farDistance;
varying vec3 vWorldPosition;

#include <common>



// /bg/MAT/meshStandardBuilder1/globals1
uniform float time;

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
	vec3 v_POLY_constant2_val = vec3(1.8, 1.8, 1.8);
	
	// /bg/MAT/meshStandardBuilder1/constant1
	vec3 v_POLY_constant1_val = vec3(0.8431372549019608, 0.09803921568627451, 0.09803921568627451);
	
	// /bg/MAT/meshStandardBuilder1/globals1
	float v_POLY_globals1_time = time;
	
	// /bg/MAT/meshStandardBuilder1/vec3ToFloat2
	float v_POLY_vec3ToFloat2_z = v_POLY_globals1_position.z;
	
	// /bg/MAT/meshStandardBuilder1/multAdd1
	float v_POLY_multAdd1_val = (-0.6*(v_POLY_globals1_time + 4.7)) + 0.0;
	
	// /bg/MAT/meshStandardBuilder1/add1
	float v_POLY_add1_sum = (v_POLY_vec3ToFloat2_z + v_POLY_multAdd1_val + 0.0);
	
	// /bg/MAT/meshStandardBuilder1/cos1
	float v_POLY_cos1_val = cos(v_POLY_add1_sum);
	
	// /bg/MAT/meshStandardBuilder1/abs2
	float v_POLY_abs2_val = abs(v_POLY_cos1_val);
	
	// /bg/MAT/meshStandardBuilder1/pow1
	float v_POLY_pow1_val = pow(v_POLY_abs2_val, 3.8);
	
	// /bg/MAT/meshStandardBuilder1/mix2
	vec3 v_POLY_mix2_mix = mix(v_POLY_constant2_val, v_POLY_constant1_val, v_POLY_pow1_val);
	
	// /bg/MAT/meshStandardBuilder1/output1
	diffuseColor.xyz = v_POLY_mix2_mix;
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
