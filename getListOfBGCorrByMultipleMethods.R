getListOfBGCorrByMultipleMethods <- function(data, methods="", offset=0){
	require(limma)
	
	##Dealing wtih the arguments
	if(methods==""){
		methods <- c("none", "normexp", "subtract", "half", "movingmin", "minimum", "edwards")
	}
	
	if(offset!=0)
		methods.offset <- paste(methods, offset, sep=".")
	else
		methods.offset <- methods
		
	##
	
	BGCorrDataList <- list()
		
	if(class(data)== "EListRaw"){
		for(i in 1:length(methods)){
			cat("Method used for background correction = ", methods[i], "\n")
			BGCorrDataList[[i]] <- backgroundCorrect(data, method=eval(parse(text=paste("'", methods[i], "'", sep=""))), offset=eval(offset))
			cat("Data corrected.\n\n")

		}
		
		names(BGCorrDataList) <- methods.offset
		
		return(BGCorrDataList)
	
	}
	
	else cat("This function only works with class 'EListRaw' type of data.\n Your class of data is : '", class(data), "'\n", sep="")
	
}