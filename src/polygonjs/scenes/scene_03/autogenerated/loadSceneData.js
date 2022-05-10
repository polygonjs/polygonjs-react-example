import {SceneDataManifestImporter} from '@polygonjs/polygonjs/dist/src/engine/io/manifest/import/SceneData';
const manifest = {
	properties: '1652140327113',
	root: '1652140327113',
	nodes: {
		COP: '1652140327113',
		bg: '1652140327113',
		'bg/MAT': '1652140327113',
		'bg/MAT/meshStandardBuilder1': '1652140327113',
		'bg/csgNetwork1': '1652140327113',
		perspectiveCamera_MAIN: '1652140327113',
		'perspectiveCamera_MAIN/events1': '1652140327113',
		perspectiveCamera_DEBUG: '1652140327113',
		'perspectiveCamera_DEBUG/events1': '1652140327113',
		lights: '1652140327113',
		camera: '1652140327113',
		'camera/actor1': '1652140327113',
		'camera/cameraControls1': '1652140327113',
		rhino: '1652140327113',
		'rhino/MAT': '1652140327113',
	},
};

export const loadSceneData_scene_03 = async (options = {}) => {
	const sceneDataRoot = options.sceneDataRoot || './polygonjs/scenes';
	return await SceneDataManifestImporter.importSceneData({
		sceneName: 'scene_03',
		urlPrefix: sceneDataRoot + '/scene_03',
		manifest: manifest,
		onProgress: options.onProgress,
	});
};
