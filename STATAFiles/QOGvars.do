/************** QOG ******************
PURPOSE OF THIS PROGRAM IS: 


INPUT DATA FILE:   qog_std_ts_jan20
OUTPUT DATA FILE:  QOG_subset_v1
***************************************/

/* CHANGE THIS FOLDER TO YOUR FOLDER ON THE LOCATION ON YOUR COMPUTER WHERE THE DATA IS */
ls 

/* To generate a log file with the var list (describe). You can do this as well
   describe using filename
   *** I RAN THIS CODE ALREADY (ERIC)
use "qog_std_ts_jan20"
set more off
log using QOGvars
des
log close

*/
capture log close
log using QoGsubset, replace

**** submit from here
** THE FIRST LINE TEMPORARILY CHANGES THE END-OF-LINE MARKER TO A ;
#delimit ;
use (
ccode
cname
year
ccodealp
cname_year
ccodealp_year
ccodecow
ccodewb
a*
) using "qog_std_ts_jan20.dta"
;

** THIS LINE CHANGES THE END-OF-LINE MARKER BACK TO A CARRIAGE RETURN
#delimit cr

save QOG_subset_v1 /* will save in the current directory */

log close

tab aii_q07
tab aii_q07,m
codebook aii_q09
tab iaep_alcc
tab iaep_alcc, m
codebook iaep_alcc
tab iaep_alcc, m nol
