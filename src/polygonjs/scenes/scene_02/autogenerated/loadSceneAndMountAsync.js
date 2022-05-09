import {loadSceneAsync_scene_02} from './loadSceneAsync.js';

export const loadSceneAndMountAsync_scene_02 = async function (options={}) {
	if(options && options.createViewer == null){
		options.createViewer = true;
	}
	return loadSceneAsync_scene_02(options);
};
