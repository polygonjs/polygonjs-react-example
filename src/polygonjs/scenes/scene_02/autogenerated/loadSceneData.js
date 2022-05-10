import {SceneDataManifestImporter} from '@polygonjs/polygonjs/dist/src/engine/io/manifest/import/SceneData';
const manifest = {
	properties: '1652140213293',
	root: '1652140213293',
	nodes: {
		COP: '1652140213293',
		bg: '1652140213293',
		'bg/MAT': '1652140213293',
		'bg/MAT/meshStandardBuilder1': '1652140213293',
		'bg/MAT/eventsNetwork1': '1652140213293',
		perspectiveCamera_MAIN: '1652140213293',
		'perspectiveCamera_MAIN/events1': '1652140213293',
		perspectiveCamera_DEBUG: '1652140213293',
		'perspectiveCamera_DEBUG/events1': '1652140213293',
		lights: '1652140213293',
		camera: '1652140213293',
		'camera/actor1': '1652140213293',
		'camera/cameraControls1': '1652140213293',
		rhino: '1652140213293',
		'rhino/MAT': '1652140213293',
	},
};

export const loadSceneData_scene_02 = async (options = {}) => {
	const sceneDataRoot = options.sceneDataRoot || './polygonjs/scenes';
	return await SceneDataManifestImporter.importSceneData({
		sceneName: 'scene_02',
		urlPrefix: sceneDataRoot + '/scene_02',
		manifest: manifest,
		onProgress: options.onProgress,
	});
};
