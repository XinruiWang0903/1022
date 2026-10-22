capture which xsmle
if _rc ssc install xsmle

import excel "数据.xlsx", firstrow clear
assert _N==2959
isid id year
assert inrange(year, 2013, 2023)
quietly bysort id: assert _N==11
xtset id year
sort id year
save "original_panel.dta", replace

preserve
import delimited using "W1.csv", clear varnames(1) encoding(UTF-8)
assert _N==269
isid id
sort id
assert id==_n
drop id
mkmat c1-c269, matrix(W1)
restore

mata: W=st_matrix("W1"); assert(rows(W)==269 & cols(W)==269); assert(max(abs(diagonal(W)))<1e-9); assert(min(W)>=0); assert(max(abs(rowsum(W):-1))<1e-8)

preserve
import delimited using "W2.csv", clear varnames(1) encoding(UTF-8)
assert _N==269
isid id
sort id
assert id==_n
drop id
mkmat c1-c269, matrix(W2)
restore

mata: W=st_matrix("W2"); assert(rows(W)==269 & cols(W)==269); assert(max(abs(diagonal(W)))<1e-9); assert(min(W)>=0); assert(max(abs(rowsum(W):-1))<1e-8)

capture log close _all
log using "SDM.log", replace text

destring CEE GF LES INL DOW GOV FDE TIL, replace 
xsmle CEE GF LES INL DOW GOV FDE TIL, ///
    wmat(W1) model(sdm) fe type(both) effects
estimates store SDM1

xsmle CEE GF LES INL DOW GOV FDE TIL, ///
    wmat(W2) model(sdm) fe type(both) effects
estimates store SDM2

estimates table SDM1 SDM2, b(%12.6f) se(%12.6f) stats(N ll)
log close
