# Data processing and transformations

## Documented from the supplied manuscript and code

1. Raw indicators were compiled from Wind, CSMAR, four Chinese statistical yearbooks, and the NBS Data Center.
2. Missing values for a small number of city-years were filled using the average of adjacent years.
3. ECEE was constructed with a super-efficiency slacks-based measure incorporating undesirable output. Inputs were labor, capital, and energy; desirable output was GDP; undesirable output was carbon emissions.
4. GF was constructed by applying the entropy method to seven green-finance components.
5. The final estimation sample is a balanced panel of 269 cities observed in each year from 2013 through 2023.
6. The Stata program converts `CEE GF LES INL DOW GOV FDE TIL GB IS UI CG TI` from text storage to numeric storage where needed.
7. City and year fixed effects are absorbed in the main regression specifications. Standard errors are clustered by city.
8. The instrumental-variable model uses the one-period lag of `GF` as the instrument for current `GF`.
9. DML specifications residualize variables with respect to city and year fixed effects, add squared control terms in nonlinear specifications, and use random forest, Elastic Net, Gradient Boosting, and LassoCV learners.
10. Spatial models use row-standardized contiguity and inverse-distance matrices. Distance-threshold regressions use `WGF_100` through `WGF_1500`.

## Information still required for full raw-data reproducibility

- Exact source file, edition/year, table, indicator name, unit, and URL/provider path for every raw variable.
- City-name and administrative-code harmonization rules across years.
- Deflation base year and the exact perpetual-inventory assumptions used for capital stock.
- Energy-conversion factors and the carbon-emission formula and coefficients.
- Full super-efficiency SBM implementation, orientation, returns-to-scale assumption, and software/code.
- Entropy-weight calculation, normalization direction, zero handling, and weights for GF and the alternative `GB` indicator.
- Exact definitions and formulas for `IS`, `UI`, `CG`, and `TI`.
- The list of observations filled by adjacent-year averaging and the rule used at sample endpoints.
- Construction code for `Boundary`, `OldIndustrial`, and `ResourceType` classifications.
- Construction and normalization code for W1, W2, and all distance-threshold spatial variables.

Without these items, referees can rerun the regressions from the analysis-ready dataset but cannot reconstruct that dataset independently from the stated raw sources.
