# Variable dictionary

The primary file is `data/analysis/panel_data_full.xlsx`, sheet `final`. It contains 2,959 city-year observations for 269 cities from 2013 through 2023. No cells are blank in the supplied analysis file.

| Variable | Role | Definition / coding | Transformation or unit information |
|---|---|---|---|
| `id` | Panel identifier | Numeric city identifier, 1–269 | Stable across years; used with `year` in `xtset` |
| `year` | Time identifier | Calendar year, 2013–2023 | Integer |
| `province` | Geographic identifier | Province-level name | Text |
| `city` | Geographic identifier | City name in the full dataset; stable `id####` value in the anonymized dataset | Text |
| `province_code` | Geographic identifier | Province administrative code | Present only in the full dataset |
| `city_code` | Geographic identifier | City administrative code | Present only in the full dataset |
| `CEE` | Dependent variable | Urban energy carbon-emission efficiency (ECEE in the manuscript) | Constructed using a super-efficiency SBM framework with undesirable outputs; raw construction code not supplied |
| `GF` | Main explanatory variable | Green finance index | Constructed by entropy weighting of green-credit, green-support, green-insurance, green-investment, green-bond, green-fund, and green-equity indicators; construction code not supplied |
| `LES` | Control | Level of economies of scale | Measured by the number of above-scale industrial enterprises; the stored scale/unit requires author confirmation |
| `INL` | Control | Informatization level | Number of Internet users per 10,000 persons |
| `DOW` | Control | Degree of openness | Foreign direct investment divided by GDP |
| `GOV` | Control | Government intervention | Government fiscal expenditure divided by GDP |
| `FDE` | Control | Financial development level | Total deposits and loans of financial institutions divided by city GDP |
| `TIL` | Control | Technology-investment level | Science and technology expenditure divided by government fiscal expenditure |
| `GB` | Robustness variable | Alternative green-finance measure | Exact component definition and transformation require author confirmation |
| `IS` | Mechanism variable | Industrial green transformation (GIT in the manuscript) | Exact formula requires author confirmation |
| `UI` | Mechanism variable | Industrial-structure upgrading (AIS in the manuscript) | Exact formula requires author confirmation |
| `CG` | Mechanism variable | Green-oriented capital allocation (GCG in the manuscript) | Exact formula requires author confirmation |
| `TI` | Mechanism variable | Green technological innovation (GTI in the manuscript) | Exact formula requires author confirmation |
| `Boundary` | Heterogeneity indicator | Provincial-border city indicator | `1` = border city; `0` = non-border city |
| `BoundaryType` | Heterogeneity category | Text label corresponding to `Boundary` | Exact Chinese category labels stored in the workbook |
| `OldIndustrial` | Heterogeneity indicator | Old industrial base city indicator | `1` = old industrial base city; `0` = otherwise |
| `ResourceType` | Heterogeneity category | Resource-based city type | Mature, growing, regenerative, declining, or non-resource-based category |
| `Longitude` | Spatial identifier | City longitude | Decimal degrees; city-level constant |
| `Latitude` | Spatial identifier | City latitude | Decimal degrees; city-level constant |
| `WGF_adj` | Spatial regressor | Spatial lag of `GF` under the contiguity matrix | Exact construction code not supplied |
| `WGF_inv` | Spatial regressor | Spatial lag of `GF` under the inverse-distance matrix | Exact construction code not supplied |
| `WGF_100` … `WGF_1500` | Distance-threshold regressors | Spatially weighted `GF` variables for thresholds from 100 km to 1,500 km in 100-km increments | Exact threshold-matrix formula and standardization procedure require author confirmation |

## Index inputs described in the manuscript but not stored separately

The ECEE construction uses labor, capital stock, energy consumption, GDP at constant prices, and carbon emissions. The GF construction uses seven components: green credit, green support, green insurance, green investment, green bonds, green funds, and green equity. The supplied analysis files contain only the resulting `CEE` and `GF` indices, not the complete component-level raw inputs.
