R_LIBRARY="/home/ubuntu/Rlibrary/3.2.3"
local({r = getOption("repos");r["CRAN"]="http://cran.ms.unimelb.edu.au"; options(repos=r)})
setRepositories(graphics=F,ind=1:6)
packs=c("survival","lattice","ggplot2","data.table","MatrixEQTL","parallel","Cairo","markdown","knitr","devtools","EasyQC_9.2.tar.gz)
install.packages(packs,lib="/home/ubuntu/Rlibrary/3.2.3")
install.packages("EasyQC_9.2.tar.gz",lib="/home/ubuntu/Rlibrary/3.2.3")
install_github("perishk/meffil")
