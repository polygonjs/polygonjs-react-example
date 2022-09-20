import { SceneDataManifestImporter } from "@polygonjs/polygonjs/dist/src/engine/io/manifest/import/SceneData";
const manifest = {
  properties: "1663711226459",
  root: "1663589189992",
  nodes: {
    COP: "1663589189992",
    bg: "1652140213293",
    "bg/MAT": "1652140213293",
    "bg/MAT/meshStandardBuilder1": "1663711226459",
    "bg/MAT/eventsNetwork1": "1663711226459",
    perspectiveCamera_MAIN: "1652140213293",
    "perspectiveCamera_MAIN/events1": "1663589189992",
    perspectiveCamera_DEBUG: "1652140213293",
    "perspectiveCamera_DEBUG/events1": "1663589189992",
    lights: "1663589189992",
    camera: "1652140213293",
    "camera/actor1": "1663589189992",
    "camera/cameraControls1": "1663589189992",
    rhino: "1663589189992",
    "rhino/MAT": "1663589189992",
  },
  shaders: {
    "/bg/MAT/meshStandardBuilder1": {
      vertex: "1663589189992",
      fragment: "1663589189992",
      "customDepthMaterial.vertex": "1663589189992",
      "customDepthMaterial.fragment": "1663589189992",
      "customDistanceMaterial.vertex": "1663589189992",
      "customDistanceMaterial.fragment": "1663589189992",
      "customDepthDOFMaterial.vertex": "1663589189992",
      "customDepthDOFMaterial.fragment": "1663589189992",
    },
  },
};

export const loadSceneData_scene_02 = async (options = {}) => {
  const sceneDataRoot = options.sceneDataRoot || "./polygonjs/scenes";
  return await SceneDataManifestImporter.importSceneData({
    sceneName: "scene_02",
    urlPrefix: sceneDataRoot + "/scene_02",
    manifest: manifest,
    onProgress: options.onProgress,
  });
};
