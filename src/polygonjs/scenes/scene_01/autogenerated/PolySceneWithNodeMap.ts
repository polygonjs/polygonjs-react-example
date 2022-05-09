
import {PolyScene} from '@polygonjs/polygonjs/dist/src/engine/scene/PolyScene';
// obj
import {CopNetworkObjNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/obj/CopNetwork';
import {GeoObjNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/obj/Geo';
import {PerspectiveCameraObjNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/obj/PerspectiveCamera';
// cop
import {EnvMapCopNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/cop/EnvMap';
import {ImageEXRCopNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/cop/ImageEXR';
// sop
import {ActorSopNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/sop/Actor';
import {BoxSopNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/sop/Box';
import {CameraControlsSopNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/sop/CameraControls';
import {CameraFrameModeSopNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/sop/CameraFrameMode';
import {EventsNetworkSopNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/sop/EventsNetwork';
import {FileGLTFSopNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/sop/FileGLTF';
import {HemisphereLightSopNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/sop/HemisphereLight';
import {HierarchySopNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/sop/Hierarchy';
import {MaterialSopNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/sop/Material';
import {MaterialsNetworkSopNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/sop/MaterialsNetwork';
import {MergeSopNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/sop/Merge';
import {NullSopNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/sop/Null';
import {ObjectPropertiesSopNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/sop/ObjectProperties';
import {PerspectiveCameraSopNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/sop/PerspectiveCamera';
import {PlaneSopNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/sop/Plane';
import {PolarTransformSopNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/sop/PolarTransform';
import {PostProcessNetworkSopNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/sop/PostProcessNetwork';
import {SpotLightSopNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/sop/SpotLight';
import {TransformSopNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/sop/Transform';
// mat
import {MeshStandardBuilderMatNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/mat/MeshStandardBuilder';
import {MeshStandardMatNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/mat/MeshStandard';
// event
import {CameraOrbitControlsEventNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/event/CameraOrbitControls';
// actor
import {AddActorNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/actor/Add';
import {FloatToVec3ActorNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/actor/FloatToVec3';
import {GetObjectPropertyActorNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/actor/GetObjectProperty';
import {MultActorNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/actor/Mult';
import {MultScalarActorNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/actor/MultScalar';
import {OnTickActorNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/actor/OnTick';
import {PlaneActorNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/actor/Plane';
import {RayFromCursorActorNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/actor/RayFromCursor';
import {RayIntersectPlaneActorNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/actor/RayIntersectPlane';
import {SetObjectLookAtActorNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/actor/SetObjectLookAt';
import {SetObjectPositionActorNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/actor/SetObjectPosition';
import {SetObjectRotationActorNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/actor/SetObjectRotation';
import {Vec3ToFloatActorNode} from '@polygonjs/polygonjs/dist/src/engine/nodes/actor/Vec3ToFloat';

export class PolySceneWithNodeMap_scene_01 extends PolyScene {
	node(path: '/COP'): CopNetworkObjNode;
	node(path: '/COP/imageEXR1'): ImageEXRCopNode;
	node(path: '/COP/envMap1'): EnvMapCopNode;
	node(path: '/einstein'): GeoObjNode;
	node(path: '/einstein/fileGLTF1'): FileGLTFSopNode;
	node(path: '/einstein/hierarchy1'): HierarchySopNode;
	node(path: '/einstein/material1'): MaterialSopNode;
	node(path: '/einstein/OUT'): NullSopNode;
	node(path: '/einstein/objectProperties1'): ObjectPropertiesSopNode;
	node(path: '/einstein/MAT'): MaterialsNetworkSopNode;
	node(path: '/einstein/MAT/meshStandard1'): MeshStandardMatNode;
	node(path: '/bg'): GeoObjNode;
	node(path: '/bg/material1'): MaterialSopNode;
	node(path: '/bg/plane1'): PlaneSopNode;
	node(path: '/bg/transform2'): TransformSopNode;
	node(path: '/bg/MAT'): MaterialsNetworkSopNode;
	node(path: '/bg/MAT/meshStandardBuilder1'): MeshStandardBuilderMatNode;
	node(path: '/perspectiveCamera_MAIN'): PerspectiveCameraObjNode;
	node(path: '/perspectiveCamera_MAIN/postProcessNetwork1'): PostProcessNetworkSopNode;
	node(path: '/perspectiveCamera_MAIN/events1'): EventsNetworkSopNode;
	node(path: '/perspectiveCamera_MAIN/events1/cameraOrbitControls1'): CameraOrbitControlsEventNode;
	node(path: '/perspectiveCamera_DEBUG'): PerspectiveCameraObjNode;
	node(path: '/perspectiveCamera_DEBUG/postProcessNetwork1'): PostProcessNetworkSopNode;
	node(path: '/perspectiveCamera_DEBUG/events1'): EventsNetworkSopNode;
	node(path: '/perspectiveCamera_DEBUG/events1/cameraOrbitControls1'): CameraOrbitControlsEventNode;
	node(path: '/lights'): GeoObjNode;
	node(path: '/lights/spotLight1'): SpotLightSopNode;
	node(path: '/lights/polarTransform1'): PolarTransformSopNode;
	node(path: '/lights/hemisphereLight1'): HemisphereLightSopNode;
	node(path: '/lights/merge1'): MergeSopNode;
	node(path: '/camera'): GeoObjNode;
	node(path: '/camera/box1'): BoxSopNode;
	node(path: '/camera/perspectiveCamera_MAIN'): PerspectiveCameraSopNode;
	node(path: '/camera/cameraFrameMode1'): CameraFrameModeSopNode;
	node(path: '/camera/hierarchy1'): HierarchySopNode;
	node(path: '/camera/cameraControls1'): CameraControlsSopNode;
	node(path: '/camera/cameraControls1/cameraOrbitControls1'): CameraOrbitControlsEventNode;
	node(path: '/camera/actor1'): ActorSopNode;
	node(path: '/camera/actor1/onTick1'): OnTickActorNode;
	node(path: '/camera/actor1/setObjectPosition1'): SetObjectPositionActorNode;
	node(path: '/camera/actor1/rayFromCursor1'): RayFromCursorActorNode;
	node(path: '/camera/actor1/plane1'): PlaneActorNode;
	node(path: '/camera/actor1/rayIntersectPlane1'): RayIntersectPlaneActorNode;
	node(path: '/camera/actor1/vec3ToFloat1'): Vec3ToFloatActorNode;
	node(path: '/camera/actor1/floatToVec3_2'): FloatToVec3ActorNode;
	node(path: '/camera/actor1/getObjectProperty1'): GetObjectPropertyActorNode;
	node(path: '/camera/actor1/vec3ToFloat2'): Vec3ToFloatActorNode;
	node(path: '/camera/actor1/setObjectLookAt1'): SetObjectLookAtActorNode;
	node(path: '/camera/actor1/setObjectRotation1'): SetObjectRotationActorNode;
	node(path: '/camera/actor1/multScalar1'): MultScalarActorNode;
	node(path: '/camera/actor1/mult1'): MultActorNode;
	node(path: '/camera/actor1/mult2'): MultActorNode;
	node(path: '/camera/actor1/add1'): AddActorNode;
	node(path: string):any /* we need any for now as otherwise an error occurs when adding plugins to the overloaded methods */ {
		return super.node(path);
	}
}
