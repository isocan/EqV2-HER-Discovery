# EquiformerV2 predicted H Adsorption Energy and Force on Surface — Column Glossary
This document describes the columns in the DataFrame containing results from the EqV2 perdicted adsorption energy, specifically for H adsorption on various surfaces. Each row corresponds to a unique surface–adsorbate configuration.

| Column | What it contains | Typical dtype / units | Notes |
|---|---|---|---|
| **key** | Identifier built as `{Bulk_id}_H_{slab-index}_{Surface}` that uniquely labels each surface–adsorbate calculation. | `str` |  |
| **key_v2** | Composite key `{Bulk_id}_{Surface}_{top}_{shift}` that identifies a unique slab termination. | `str` |  |
| **Bulk_id** | Materials Project ID of the **bulk parent** structure. | `str` (e.g. `"mp-1412"`) | Links slab → bulk metadata. |
| **in_domain** | Whether the slab composition and adsorbate appear in the **OC20 dataset**. | `bool` |  |
| **Crystal System** | Five-system crystallographic family of the bulk (Cubic, Tetragonal…). | `str` | Returned via Materials Project API. |
| **Point Group** | Schoenflies / Hermann-Mauguin point group of the bulk (`Pm3n`, `I4mcm`, …). | `str` | Returned via Materials Project API. |
| **symbol** | **Chemical formula** of the slab (electronegativity-sorted). | `str` | e.g. `"Ti6Sb2"`. |
| **Bulk_concentration** | Elemental fractions **in the bulk** crystal. | `dict → float` | `{ "Ti": 75.0, "Sb": 25.0 }` (percent). |
| **formation_energy_per_atom** | Formation energy of the bulk structure per atom relative to elemental references. | `float` (eV/atom) | Pulled via Materials Project API. |
| **Exp_Observed** | Flag indicating whether *experimental evidence exists* for the adsorption configuration. | `bool` | Values obtained via Materials Project API. |
| **Ametal** | First element in the alloy pair (A). | `str` | e.g. `Cu`. |
| **Bmetal** | Second element in the alloy pair (B). | `str` | e.g. `Sb`. |
| **AandB** | Stored exactly as `"A-B"`. | `str` | Handy for grouping by alloy pair. |
| **Surface** | Miller index of the exposed surface. | `int / str` | `110`, `211`, etc. |
| **slab index** | Counter for symmetry-inequivalent slabs cut from the same bulk & facet. | `int` (1-based) | Distinguishes multiple terminations. |
| **surface_concentration** | Elemental fractions **in the outermost slab layer(s)** before adsorption. | `dict → float` |  |
| **site_type** | Categorical label of the adsorption site (`top`, `bridge`, `3-fold`, `4-fold`). | `str` | From nearest-neighbour geometry. |
| **nearest_atoms** | Element symbols of atoms directly bonded to the adsorbate. | `list[str]` | e.g. `["Ti", "Ti", "Ti"]`. |
| **top** | `True` if the adsorbate sits on the surface-exposed side, otherwise `False`. | `bool` |  |
| **shift** | Termination parameter (0 ≤ shift < 1) indicating the cut position along the surface normal in pymatgen. | `float` | Distinguishes symmetry-inequivalent terminations. |
| **total_atoms** | Atom count in the simulation cell **including adsorbate**. | `int` |  |
| **trajectory_file** | Path to the `.traj` file containing the *minimum-energy* H-adsorbed structure chosen from ~85 AdsorbML relaxations. | `str` |  |
| **max_Force** | Maximum atomic force **after ML relaxation**. | `float` (eV Å⁻¹) | Convergence metric. |
| **Adsorption_Energy** | EqV2-predicted adsorption energy of H on the slab. | `float` (eV) |  |

