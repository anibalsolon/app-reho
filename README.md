<h1 align="center">Regional Homogeneity (ReHo)</h1>

<p align="center">
  Computes a voxelwise Regional Homogeneity (ReHo) map from BOLD fMRI with AFNI 3dReHo, z-scores it and optionally smooths it with 3dBlurToFWHM.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.567"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.567-blue.svg" alt="Run on brainlife.io"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-see_LICENSE-lightgrey.svg" alt="License"></a>
</p>

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Computes a voxelwise Regional Homogeneity (ReHo) map from BOLD fMRI with AFNI 3dReHo, z-scores it and optionally smooths it with 3dBlurToFWHM.**

Runs AFNI 3dReHo (Kendall's coefficient of concordance over a 7, 19 or 27-voxel neighbourhood) on the BOLD series, z-scores the map using its mean and standard deviation, and, if fwhm is not 0, blurs it to that smoothness with 3dBlurToFWHM. Use it for local functional connectivity analysis of resting-state fMRI. An optional brain mask restricts the computation.

| | |
|---|---|
| **Inputs** | `neuro/func/task` · `neuro/mask` (optional) |
| **Outputs** | `neuro/reho` |
| **Container** | `anibalsolon/app-reho:v0.0.1` |
| **Resources** | 16 CPUs |
| **Run it** | [doi.org/10.25663/brainlife.app.567](https://doi.org/10.25663/brainlife.app.567) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `bold` | `neuro/func/task` | yes | 4D BOLD fMRI series (ideally preprocessed). |
| `mask` | `neuro/mask` | no | Optional brain mask restricting ReHo and smoothing to voxels inside it. Must be on the same grid as the BOLD image. |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `reho` | `neuro/reho` | Z-scored ReHo map (reho.nii.gz), smoothed when fwhm is not 0. |

<details>
<summary><b>Parameters</b> (2)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `neighborhood` | enum | `27` | Number of voxels in the neighbourhood passed to 3dReHo -nneigh: 7 (faces), 19 (faces and edges) or 27 (faces, edges and corners). Options: `7`, `19`, `27`. |
| `fwhm` | number | `0` | Smoothing parameter (in mm). Blurs the image until it reaches the FWHM smoothness. |

</details>

<!-- brainlife-app:end -->

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.567](https://doi.org/10.25663/brainlife.app.567), choose `neuro/func/task`, `neuro/mask` from your project, set the parameters and press **Execute**. The results are saved to your project as `neuro/reho`.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) (the App runs in `anibalsolon/app-reho:v0.0.1`), [`jq`](https://jqlang.github.io/jq/).

1. Clone this repository.
2. Create `config.json` with the paths to your inputs and the parameters:

   ```json
   {
       "bold": "/path/to/bold/bold",
       "mask": "/path/to/mask/mask",
       "neighborhood": "27",
       "fwhm": 0
   }
   ```

3. Run `./main`.

## Citing

If you use this App, please cite it, the software it builds on and brainlife.io:

- Regional Homogeneity (ReHo). brainlife.io App. [doi:10.25663/brainlife.app.567](https://doi.org/10.25663/brainlife.app.567)
- Cox. AFNI: Software for Analysis and Visualization of Functional Magnetic Resonance Neuroimages. *Computers and Biomedical Research* 29:162-173 (1996). [doi:10.1006/cbmr.1996.0014](https://doi.org/10.1006/cbmr.1996.0014)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

Maintained by [@anibalsolon](https://github.com/anibalsolon).

## License

See [LICENSE](LICENSE).
