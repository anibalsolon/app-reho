<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Computes a voxelwise Regional Homogeneity (ReHo) map from BOLD fMRI with AFNI 3dReHo, z-scores it and optionally smooths it with 3dBlurToFWHM.**

Runs AFNI 3dReHo (Kendall's coefficient of concordance over a 7, 19 or 27-voxel neighbourhood) on the BOLD series, z-scores the map using its mean and standard deviation, and, if fwhm is not 0, blurs it to that smoothness with 3dBlurToFWHM. Use it for local functional connectivity analysis of resting-state fMRI. An optional brain mask restricts the computation.

| | |
|---|---|
| 📥 **Inputs** | `neuro/func/task` · `neuro/mask` (optional) |
| 📤 **Outputs** | `neuro/reho` |
| 🐳 **Container** | `anibalsolon/app-reho:v0.0.1` |
| ⚙️ **Resources** | 16 CPUs |
| 🔗 **Run it** | [doi.org/10.25663/brainlife.app.567](https://doi.org/10.25663/brainlife.app.567) |

#### 📥 Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `bold` | `neuro/func/task` | yes | 4D BOLD fMRI series (ideally preprocessed). |
| `mask` | `neuro/mask` | no | Optional brain mask restricting ReHo and smoothing to voxels inside it. Must be on the same grid as the BOLD image. |

#### 📤 Outputs

| Output | Datatype | Description |
|---|---|---|
| `reho` | `neuro/reho` | Z-scored ReHo map (reho.nii.gz), smoothed when fwhm is not 0. |

<details>
<summary><b>⚙️ Parameters</b> (2)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `neighborhood` | enum | `27` | Number of voxels in the neighbourhood passed to 3dReHo -nneigh: 7 (faces), 19 (faces and edges) or 27 (faces, edges and corners). Options: `7`, `19`, `27`. |
| `fwhm` | number | `0` | Smoothing parameter (in mm). Blurs the image until it reaches the FWHM smoothness. |

</details>

<!-- brainlife-app:end -->

# Regional Homogeneity app