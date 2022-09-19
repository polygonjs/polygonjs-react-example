import { SceneJsonExporterData } from "@polygonjs/polygonjs/dist/src/engine/io/json/export/Scene";

export type OnProgressCallback = (ratio: number, args: any) => void;

interface LoadManifestOptions {
  onProgress?: OnProgressCallback;
  sceneDataRoot?: string;
}

type LoadSceneData_scene_03 = (
  options?: LoadManifestOptions
) => Promise<SceneJsonExporterData>;

export const loadSceneData_scene_03: LoadSceneData_scene_03;
