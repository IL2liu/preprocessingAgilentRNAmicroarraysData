#libraries
library(limma)

#directories
#1.indicate the directory in which the feature extraction files have been saved.

featureExtractionFiles.dir <- "/Users/sebmella/Documents/analyses_transriptome/B_GIROS/Projets_Giros/Giros002_11327_RNA/allFeatureExtractionFiles/"

	#note : this need to be changed with the data on galaxy library

#2 indicate the directory containing the SDRF file(=file containing the relationship between the experiement and the microarrays)

sdrf.dir <- "/Users/sebmella/Documents/analyses_transriptome/B_GIROS"

	#note : this need to be changed with the data on galaxy library

#loading SDRF
	#setting directory containing the SDRF file
	setwd(sdrf.dir)

	#indicating name of the SDRF file
	sdrf.name <- "bgirosRNA.sdrf.26nov.csv"
	
	#note : this need to be changed with the data on galaxy library

	#reading the file
	SDRF <- read.csv(sdrf.name, header=T, sep=';', stringsAsFactors=F) # if not wormking --> verify what character is used as separator.
	
#reading extraction feature files corresponding to LC REgion with limma

	setwd(featureExtractionFiles.dir)
	LC.limma <- read.maimages(SDRFbGiros[SDRFbGiros["Regions"]=="LC","featureExtractionFiles"], source='agilent', green.only=T)

	#adding Genotype info in $targets
	for(i in 1:nrow(LC.limma$targets)){
		LC.limma$targets$Genotype[i] <- SDRFbGiros[SDRFbGiros$featureExtractionFiles == LC.limma$targets$FileName[i],]$Genotype
	}