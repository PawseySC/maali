# 
library(glmmADMB) 
library(ggplot2)
#library(coefplot2) 
library(bbmle) 

Owls <- transform(Owls,
	Nest=reorder(Nest,NegPerChick), 
	logBroodSize=log(BroodSize), 
	NCalls=SiblingNegotiation)

fit_zipoiss <- glmmadmb(NCalls~(FoodTreatment+ArrivalTime)*SexParent+ offset(logBroodSize)+(1|Nest), 
	data=Owls, 
	zeroInflation=TRUE, 
	family="poisson")

summary(fit_zipoiss)
 
#coefplot2(fit_zipoiss)

fit_zinbinom <- glmmadmb(NCalls~(FoodTreatment+ArrivalTime)*SexParent+offset(logBroodSize)+(1|Nest),
	data=Owls, 
	zeroInflation=TRUE, 
	family="nbinom")

fit_zinbinom1 <- glmmadmb(NCalls~(FoodTreatment+ArrivalTime)*SexParent+ offset(logBroodSize)+(1|Nest), data=Owls, zeroInflation=TRUE, family="nbinom1")

fit_zinbinom1_bs <- glmmadmb(NCalls~(FoodTreatment+ArrivalTime)*SexParent+ BroodSize+(1|Nest), data=Owls, zeroInflation=TRUE, family="nbinom1")

AICtab(fit_zipoiss,fit_zinbinom,fit_zinbinom1,fit_zinbinom1_bs)

vn <- c("food","arrivaltime","sex","food:sex","arrival:sex","broodsize") 
 
#coefplot2(list(ZIP=fit_zipoiss, ZINB=fit_zinbinom, ZINB1=fit_zinbinom1, ZINB1_brood=fit_zinbinom1_bs), varnames=vn, legend=TRUE) 
