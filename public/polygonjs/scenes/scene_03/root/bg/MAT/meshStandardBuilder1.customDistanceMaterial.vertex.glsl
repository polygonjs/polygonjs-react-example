#define DISTANCE
varying vec3 vWorldPosition;
#include <common>



// /bg/MAT/meshStandardBuilder1/globals1
uniform float time;

// /bg/MAT/meshStandardBuilder1/globals1
varying vec3 v_POLY_globals1_position;




#include <uv_pars_vertex>
#include <displacementmap_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <skinbase_vertex>
	#ifdef USE_DISPLACEMENTMAP
// removed:
//		#include <beginnormal_vertex>
		#include <morphnormal_vertex>
		#include <skinnormal_vertex>
	#endif
// removed:
//	#include <begin_vertex>



	// /bg/MAT/meshStandardBuilder1/globals1
	v_POLY_globals1_position = vec3(position);
	float v_POLY_globals1_time = time;
	
	// /bg/MAT/meshStandardBuilder1/output1
	vec3 transformed = position;
	vec3 objectNormal = normal;
	#ifdef USE_TANGENT
		vec3 objectTangent = vec3( tangent.xyz );
	#endif



	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <worldpos_vertex>
	#include <clipping_planes_vertex>
	vWorldPosition = worldPosition.xyz;
}