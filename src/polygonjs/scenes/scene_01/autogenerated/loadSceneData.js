import { SceneDataManifestImporter } from "@polygonjs/polygonjs/dist/src/engine/io/manifest/import/SceneData";
const manifest = {
  properties: "1664745197397",
  root: "1663589162866",
  nodes: {
    COP: "1663589146588",
    einstein: "1663589146588",
    "einstein/MAT": "1663589146588",
    bg: "1663589146588",
    "bg/MAT": "1652130484804",
    "bg/MAT/meshStandardBuilder1": "1663589146588",
    perspectiveCamera_MAIN: "1652130484804",
    "perspectiveCamera_MAIN/events1": "1663589146588",
    perspectiveCamera_DEBUG: "1652130484804",
    "perspectiveCamera_DEBUG/events1": "1663589146588",
    lights: "1663589146588",
    camera: "1663589146588",
    "camera/cameraControls1": "1663589146588",
    "camera/actor1": "1663589146588",
  },
  shaders: {
    "/bg/MAT/meshStandardBuilder1": {
      vertex: "1663589146588",
      fragment: "1663589146588",
      "customDepthMaterial.vertex": "1663589146588",
      "customDepthMaterial.fragment": "1663589146588",
      "customDistanceMaterial.vertex": "1663589146588",
      "customDistanceMaterial.fragment": "1663589146588",
      "customDepthDOFMaterial.vertex": "1663589146588",
      "customDepthDOFMaterial.fragment": "1663589146588",
    },
  },
};

export const loadSceneData_scene_01 = async (options = {}) => {
  const sceneDataRoot = options.sceneDataRoot || "./polygonjs/scenes";
  return await SceneDataManifestImporter.importSceneData({
    sceneName: "scene_01",
    urlPrefix: sceneDataRoot + "/scene_01",
    manifest: manifest,
    onProgress: options.onProgress,
  });
};
