import {SceneJsonExporterData} from '@polygonjs/polygonjs/dist/src/engine/io/json/export/Scene';
import {BaseViewerType} from '@polygonjs/polygonjs/dist/src/engine/viewers/_Base';
import {PolySceneWithNodeMap_scene_03} from './PolySceneWithNodeMap';

type OnProgressCallback = (ratio: number, args: any) => void;
type ConfigureSceneData = (sceneData: SceneJsonExporterData) => void;

export interface LoadSceneAsyncOptions {
	onProgress?: OnProgressCallback;
	domElement?: HTMLElement|string;
	moduleImportSuffix?: string;
	loadModules?: boolean;
	runRegister?: boolean;
	configureSceneData?: ConfigureSceneData;
	sceneDataRoot?: string;
	assetsRoot?: string;
	libsRootPrefix?: string;
	autoPlay?: boolean;
	createViewer?: boolean;
	printWarnings?: boolean;
}
export interface LoadedData {
	scene: PolySceneWithNodeMap_scene_03;
	viewer: BaseViewerType | undefined;
}
export type LoadSceneAsync_scene_03 = (options?: LoadSceneAsyncOptions) => Promise<LoadedData>;

export const loadSceneAsync_scene_03: LoadSceneAsync_scene_03;
