import {SceneDataManifestImporter} from '@polygonjs/polygonjs/dist/src/engine/io/manifest/import/SceneData';
const manifest = {
	properties: '1652130484804',
	root: '1652130484804',
	nodes: {
		COP: '1652130484804',
		einstein: '1652130484804',
		'einstein/MAT': '1652130484804',
		bg: '1652130484804',
		'bg/MAT': '1652130484804',
		'bg/MAT/meshStandardBuilder1': '1652130484804',
		perspectiveCamera_MAIN: '1652130484804',
		'perspectiveCamera_MAIN/events1': '1652130484804',
		perspectiveCamera_DEBUG: '1652130484804',
		'perspectiveCamera_DEBUG/events1': '1652130484804',
		lights: '1652130484804',
		camera: '1652130484804',
		'camera/cameraControls1': '1652130484804',
		'camera/actor1': '1652130484804',
	},
};

export const loadSceneData_scene_01 = async (options = {}) => {
	const sceneDataRoot = options.sceneDataRoot || './polygonjs/scenes';
	return await SceneDataManifestImporter.importSceneData({
		sceneName: 'scene_01',
		urlPrefix: sceneDataRoot + '/' + 'scene_01',
		manifest: manifest,
		onProgress: options.onProgress,
	});
};
