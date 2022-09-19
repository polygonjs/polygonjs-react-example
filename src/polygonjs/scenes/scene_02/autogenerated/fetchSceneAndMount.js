import { loadScene_scene_02 } from "./loadScene.js";

export const fetchSceneAndMount_scene_02 = async function (options = {}) {
  if (options && options.createViewer == null) {
    options.createViewer = true;
  }
  return loadScene_scene_02(options);
};
