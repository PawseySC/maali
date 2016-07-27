R_LIBRARY="/home/ubuntu/Rlibrary/3.2.3"
local({r = getOption("repos");r["CRAN"]="http://cran.ms.unimelb.edu.au"; options(repos=r)})
setRepositories(graphics=F,ind=1:6)
packs=c("data.table","Cario","markdown","knitr","devtools")
install.packages(packs,lib="/home/ubuntu/Rlibrary/3.2.3")
install_github("perishk/meffil")
