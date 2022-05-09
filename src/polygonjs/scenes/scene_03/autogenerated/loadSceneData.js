import {SceneDataManifestImporter} from '@polygonjs/polygonjs/dist/src/engine/io/manifest/import/SceneData';
const manifest = {
	properties: '1652136020863',
	root: '1652136020863',
	nodes: {
		COP: '1652136020863',
		bg: '1652136020863',
		'bg/MAT': '1652136020863',
		'bg/MAT/meshStandardBuilder1': '1652136020863',
		'bg/csgNetwork1': '1652136020863',
		perspectiveCamera_MAIN: '1652136020863',
		'perspectiveCamera_MAIN/events1': '1652136020863',
		perspectiveCamera_DEBUG: '1652136020863',
		'perspectiveCamera_DEBUG/events1': '1652136020863',
		lights: '1652136020863',
		camera: '1652136020863',
		'camera/actor1': '1652136020863',
		'camera/cameraControls1': '1652136020863',
		rhino: '1652136020863',
		'rhino/MAT': '1652136020863',
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
