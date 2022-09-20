import { SceneDataManifestImporter } from "@polygonjs/polygonjs/dist/src/engine/io/manifest/import/SceneData";
const manifest = {
  properties: "1663711234302",
  root: "1663589294430",
  nodes: {
    COP: "1663589294430",
    bg: "1663589294430",
    "bg/MAT": "1663589294430",
    "bg/MAT/meshStandardBuilder1": "1663589294430",
    "bg/csgNetwork1": "1652140327113",
    perspectiveCamera_MAIN: "1652140327113",
    "perspectiveCamera_MAIN/events1": "1663589294430",
    perspectiveCamera_DEBUG: "1652140327113",
    "perspectiveCamera_DEBUG/events1": "1663589294430",
    lights: "1652140327113",
    camera: "1652140327113",
    "camera/actor1": "1663589294430",
    "camera/cameraControls1": "1663589294430",
    rhino: "1652140327113",
    "rhino/MAT": "1663589294430",
  },
  shaders: {
    "/bg/MAT/meshStandardBuilder1": {
      vertex: "1663589294430",
      fragment: "1663589294430",
      "customDepthMaterial.vertex": "1663589294430",
      "customDepthMaterial.fragment": "1663589294430",
      "customDistanceMaterial.vertex": "1663589294430",
      "customDistanceMaterial.fragment": "1663589294430",
      "customDepthDOFMaterial.vertex": "1663589294430",
      "customDepthDOFMaterial.fragment": "1663589294430",
    },
  },
};

export const loadSceneData_scene_03 = async (options = {}) => {
  const sceneDataRoot = options.sceneDataRoot || "./polygonjs/scenes";
  return await SceneDataManifestImporter.importSceneData({
    sceneName: "scene_03",
    urlPrefix: sceneDataRoot + "/scene_03",
    manifest: manifest,
    onProgress: options.onProgress,
  });
};
