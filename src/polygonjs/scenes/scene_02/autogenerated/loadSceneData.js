import {SceneDataManifestImporter} from '@polygonjs/polygonjs/dist/src/engine/io/manifest/import/SceneData';
const manifest = {
	properties: '1652136503917',
	root: '1652136503917',
	nodes: {
		COP: '1652136503917',
		bg: '1652136503917',
		'bg/MAT': '1652136503917',
		'bg/MAT/meshStandardBuilder1': '1652136503917',
		'bg/MAT/eventsNetwork1': '1652136503917',
		perspectiveCamera_MAIN: '1652136503917',
		'perspectiveCamera_MAIN/events1': '1652136503917',
		perspectiveCamera_DEBUG: '1652136503917',
		'perspectiveCamera_DEBUG/events1': '1652136503917',
		lights: '1652136503917',
		camera: '1652136503917',
		'camera/actor1': '1652136503917',
		'camera/cameraControls1': '1652136503917',
		rhino: '1652136503917',
		'rhino/MAT': '1652136503917',
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
