normalizationBy2methods <- function(listOfElist){
	norm.list <- list()
	norm.methods <- c("quantile", "cyclicloess")
	name.norm.list <- vector()
	
	index <- 0
	for(i in 1:length(listOfElist)){
		for(j in 1:length(norm.methods)){
			method.name <- norm.methods[j]
			dataset.name <- names(listOfElist)[i]
			cat("data to be normalized = ", dataset.name, "\n")
			cat("normalization method = ", method.name, "\n")
			index <- index+1
			cat("index = ", index,"\n")
			norm.list[[index]] <- normalizeBetweenArrays(listOfElist[[i]], method=eval(parse(text=paste("'", method.name, "'", sep=""))))
			name.norm.list[index] <- paste(dataset.name, method.name, sep=".") 	
		}
	}
	names(norm.list) <- name.norm.list
	return(norm.list)
}