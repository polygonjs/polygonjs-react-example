import {loadSceneAsync_scene_03} from './loadSceneAsync.js';

export const loadSceneAndMountAsync_scene_03 = async function (options={}) {
	if(options && options.createViewer == null){
		options.createViewer = true;
	}
	return loadSceneAsync_scene_03(options);
};
