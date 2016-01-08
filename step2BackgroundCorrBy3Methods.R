threeBackgroundCorrection <- function(EList, offset=18){
	meth <- c("none", "normexp")
	l1 <- getListOfBGCorrByMultipleMethods(data=EList, methods=meth)
	l2 <- getListOfBGCorrByMultipleMethods(data=EList, methods="normexp", offset=eval(offset))
	l3 <- append(l1,l2)
	
	cat("Creating the density curve for the three correction (x/y axis range = -40,150)\n")
	
	plotDensityCurveForMultipleBGCorr(l3)
}

