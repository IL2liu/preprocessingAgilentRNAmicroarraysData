plotDensityCurveForMultipleBGCorr <- function(listOfElist){
	require(ggplot2)
	require(plyr)
	
	BGCorrDataMeanList <- list()
	names <- vector()
	
	for(i in 1:length(listOfElist)){
		names[i] <- names(listOfElist)[i]
		BGCorrDataMeanList[[i]] <- apply(data.frame(listOfElist[[i]]$E)[,1:8],1,mean)
		}
	 
	 names(BGCorrDataMeanList) <- names
	 tempdf <- ldply(BGCorrDataMeanList, data.frame)
	 names(tempdf) <- c("methods", "values")
	 p <- ggplot(tempdf, aes(x=values, colour=as.factor(methods)))+geom_line(stat="density")+xlim(c(-40, 150))+theme_minimal()+scale_colour_discrete(name="Methods")
	 print(p)
}	