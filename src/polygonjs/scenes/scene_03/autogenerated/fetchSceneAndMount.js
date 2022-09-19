import { loadScene_scene_03 } from "./loadScene.js";

export const fetchSceneAndMount_scene_03 = async function (options = {}) {
  if (options && options.createViewer == null) {
    options.createViewer = true;
  }
  return loadScene_scene_03(options);
};
