// actor
import { AddActorNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/actor/Add";
import { FloatToVec3ActorNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/actor/FloatToVec3";
import { GetObjectPropertyActorNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/actor/GetObjectProperty";
import { MultActorNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/actor/Mult";
import { MultScalarActorNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/actor/MultScalar";
import { OnTickActorNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/actor/OnTick";
import { PlaneActorNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/actor/Plane";
import { RayFromCursorActorNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/actor/RayFromCursor";
import { RayIntersectPlaneActorNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/actor/RayIntersectPlane";
import { SetObjectLookAtActorNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/actor/SetObjectLookAt";
import { SetObjectPositionActorNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/actor/SetObjectPosition";
import { SetObjectRotationActorNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/actor/SetObjectRotation";
import { Vec3ToFloatActorNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/actor/Vec3ToFloat";
// cop
import { EnvMapCopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/cop/EnvMap";
import { ImageEXRCopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/cop/ImageEXR";
// event
import { CameraOrbitControlsEventNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/event/CameraOrbitControls";
// mat
import { MeshStandardMatNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/mat/MeshStandard";
import { MeshStandardBuilderMatNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/mat/MeshStandardBuilder";
// obj
import { CopNetworkObjNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/obj/CopNetwork";
import { GeoObjNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/obj/Geo";
import { PerspectiveCameraObjNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/obj/PerspectiveCamera";
// sop
import { ActorSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Actor";
import { BoxSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Box";
import { CameraControlsSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/CameraControls";
import { CameraFrameModeSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/CameraFrameMode";
import { EventsNetworkSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/EventsNetwork";
import { FileGLTFSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/FileGLTF";
import { HemisphereLightSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/HemisphereLight";
import { HierarchySopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Hierarchy";
import { MaterialSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Material";
import { MaterialsNetworkSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/MaterialsNetwork";
import { MergeSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Merge";
import { NullSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Null";
import { ObjectPropertiesSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/ObjectProperties";
import { PerspectiveCameraSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/PerspectiveCamera";
import { PlaneSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Plane";
import { PolarTransformSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/PolarTransform";
import { PostProcessNetworkSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/PostProcessNetwork";
import { SpotLightSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/SpotLight";
import { TransformSopNode } from "@polygonjs/polygonjs/dist/src/engine/nodes/sop/Transform";

export const requiredImports_scene_01 = {
  nodes: [
    AddActorNode,
    FloatToVec3ActorNode,
    GetObjectPropertyActorNode,
    MultActorNode,
    MultScalarActorNode,
    OnTickActorNode,
    PlaneActorNode,
    RayFromCursorActorNode,
    RayIntersectPlaneActorNode,
    SetObjectLookAtActorNode,
    SetObjectPositionActorNode,
    SetObjectRotationActorNode,
    Vec3ToFloatActorNode,
    EnvMapCopNode,
    ImageEXRCopNode,
    CameraOrbitControlsEventNode,
    MeshStandardMatNode,
    MeshStandardBuilderMatNode,
    CopNetworkObjNode,
    GeoObjNode,
    PerspectiveCameraObjNode,
    ActorSopNode,
    BoxSopNode,
    CameraControlsSopNode,
    CameraFrameModeSopNode,
    EventsNetworkSopNode,
    FileGLTFSopNode,
    HemisphereLightSopNode,
    HierarchySopNode,
    MaterialSopNode,
    MaterialsNetworkSopNode,
    MergeSopNode,
    NullSopNode,
    ObjectPropertiesSopNode,
    PerspectiveCameraSopNode,
    PlaneSopNode,
    PolarTransformSopNode,
    PostProcessNetworkSopNode,
    SpotLightSopNode,
    TransformSopNode,
  ],
  operations: [],
};
