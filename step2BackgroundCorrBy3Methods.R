threeBackgroundCorrection <- function(EList, offset=18){
	l1 <- getListOfBGCorrByMultipleMethods(data=EList, methods=meth)
	l2 <- getListOfBGCorrByMultipleMethods(data=EList, methods="normexp", offset=eval(18))
	l3 <- append(l1,l2)
	return(l3)
	
	
	#plotting the density curve for the three correction (x/y axis range = -40,150)
	meth <- c("none", "normexp")
	df1 <- getMeanOfBGCorrByMultipleMethods(LC.limma, methods=meth)
	df2 <- getMeanOfBGCorrByMultipleMethods(LC.limma, methods="normexp", offset=18)
	df3 <- rbind(df1,df2)
	p <- ggplot(df3, aes(x=values, colour=as.factor(methods)))+geom_line(stat="density")+xlim(c(-40, 150))+theme_minimal()+scale_colour_discrete(name="Methods")
	print (p)
}
