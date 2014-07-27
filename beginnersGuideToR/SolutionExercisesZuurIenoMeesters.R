#    Solution files for 'A Beginner's Guide to R' by
#    Alain Zuur, Elena Ieno and Erik Meesters
#    For suggestions and remarks: highstat@highstat.com  
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#



#########################################################################
#Solutions Chapter 2
#Section 2.4. Exercise 1

LengthCT <- c(75, 85, 91.6, 95, NA, 105.5, 106)
Tb       <- c(0, 0, 1, NA, 0, 0, 0)

#What is the average length of the seven animals?
mean(LengthCT, na.rm = TRUE)


#Section 2.4. Exercise 2
Farm <- c("MO", "MO", "MO", "MO", "LN", "SE", "QM")

#Or:
#Farm <- rep(c("MO", "LN", "SE", "QM"), c(4, 1, 1, 1))

Month    <- c(11,  7,  7,   NA,  9,     9,  11)
LengthCT <- c(75, 85, 91.6, 95, NA, 105.5, 106)
Tb       <- c( 0,  0,  1,   NA,  0,   0,     0)
Boar <- cbind(Month, LengthCT, Tb)

Boar[,1]
dim(Boar)
nrow(Boar)
ncol(Boar)

             
#Section 2.4. Exercise 3
Tb2 <- vector(length = 7)
Tb2[]  <- NA
Tb2[1] <- 0
Tb2[2] <- 0
Tb2[3] <- 1
Tb2[5] <- 0
Tb2[6] <- 0
Tb2[7] <- 0
Tb2
#This is useful of you have a loop, and want to store information
            
           
#Section 2.4. Exercise 4             
D <- matrix(nrow = 3, ncol = 3)
D[1,] <- c(1, 2, 3)
D[2,] <- c(4, 2, 1)
D[3,] <- c(2, 2, 0)

D
t(D)      #Transpose
solve(D)  #Inverse
D %*% solve(D) #Should be the identity matrix 
     
#Section 2.4. Exercise 5
#A data frame is a better way to combine
#variables that are a mixture of factors and 
#continuous variables:
Boar2 <- data.frame(
             Month   = Month,
             Tb      = Tb,
             FarmID  = Farm,
             Length  = LengthCT )

Boar2$SQLength <- sqrt(Boar2$Length)             
Boar2

Boar3 <- list(Month   = Month,
             Tb      = Tb,
             FarmID  = Farm,
             Length  = LengthCT)
Boar3
#In a data frame it is easier to delete rows or sub-select rows

#Section 2.4. Exercise 6
#There are empty cells and variable names with spaces
#Remove the spaces in variable names and empty cells
#should be replaced by an NA 
 
#This code is computer specific.
#On a Mac use:
setwd("/Users/Highstat/applicat/HighlandStatistics/Courses/FilesBeginnersGuide2R/BeginnersGuideToR/Data")

#On a Windows OS computer use:
setwd("Z:/Users/Highstat/applicat/HighlandStatistics/Courses/FilesBeginnersGuide2R/BeginnersGuideToR/Data")

#You need to replace the entire path by the directory in which you 
#saved the data. 

BioLum <- read.table(file = "ISIT.txt", header = TRUE, dec = ".")
BioLum2 <- scan(file = "ISIT.txt", skip = 1, dec = ".")
#read.table is more user friendly
#can is useful for large data sets.

names(BioLum)
str(BioLum)



#Section 2.4. Exercise 7
#This code is computer specific.
#On a Mac use:
setwd("/Users/Highstat/applicat/HighlandStatistics/Courses/FilesBeginnersGuide2R/BeginnersGuideToR/Data")

#On a Windows OS computer use:
setwd("Z:/Users/Highstat/applicat/HighlandStatistics/Courses/FilesBeginnersGuide2R/BeginnersGuideToR/Data")

#You need to replace the entire path by the directory in which you 
#saved the data. 

Deer <- read.table(file = "Deer.txt", header = TRUE, dec = ".")

names(Deer)
#"Farm"    "Month"   "Year"    "Sex"     "clas1_4" "LCT"
#"KFI"     "vas_2"   "Tb" 
str(Deer)






#########################################################################
#Solutions Chapter 3



#Section 3.7. Exercise 1
#This code is computer specific.
#On a Mac use:
setwd("/Users/Highstat/applicat/HighlandStatistics/Books/Book3/SolutionExercises")

#On a Windows OS computer use:
setwd("C:/Users/Highstat/applicat/HighlandStatistics/Books/Book3/SolutionExercises")

#You need to replace the entire path by the directory in which you 
#saved the data. 


#Open the Excel file BirdFlu.xls
#You need to remove the spaces in: Lao People's Democratic Republic
#You need to remove the first 8 rows and export the data as a tab-delimited 
#ascii file.
#Change the column names into more appropriate names..and save your file
#Use the rad.table command to import the data into R

#There is somehwhere a hidden space or enter on the "Indonesia" line in the BirdFlu.xls file and it creates some trouble in certain Excel versions on certain operating systems.

#Solution 1: Export the data from Excel as a csv file, and then the read.csv can be used in R
#Solution 2: Copy-paste the data into a new Excel file (as text) and hope that the hidden enter/space is omitted.

BF <- read.table(file = "BirdFluAlain.txt", header = TRUE, dec = ".")

names(BF)
std(BF)

BF[,"Cases2003"]
BF$Cases2003
BF[,1]

#What is the total number of bird flu cases in 2003 and in 2005? 
sum(BF[,"Cases2003"])
sum(BF[,"Cases2005"])


#Which country has had the most cases? 
BF$TotalCases <- BF$Cases2003 + BF$Cases2004 + BF$Cases2005 + BF$Cases2006 + BF$Cases2007 + BF$Cases2008

BF

#Which country has had the least bird flu deaths?
BF$TotalDeaths <- BF$Deaths2003 + BF$Deaths2004 + BF$Deaths2005 + BF$Deaths2006 + BF$Deaths2007 + BF$Cases2008

BF


#Using methods from Chapter 2, what is the total number of bird flu cases per country? 
#What is the total number of cases per year?
#See above..



#In fact..this data has been poorly organised in Excel. If you
#want to analyse the data using regression techniques then you need to re-organise
#it. The following code uses functions from other chaptersâ€¦.but it is useful once
#you have read the entire book.

#Redefine BF as we added some columns
BF <- read.table(file = "BirdFluAlain.txt", header = TRUE, dec = ".")

Data4Analysis <- data.frame(CasesDeaths = as.vector(as.matrix(BF)),
                            Country     = rep(rownames(BF), ncol(BF)),
                            Year        = rep(c(2003, 2003, 2004, 2004, 2005, 2005, 
                                                2006, 2006, 2007, 2007, 2008, 2008), each = nrow(BF)),
                            CD          = rep(c("Cases", "Deaths", "Cases", "Deaths",
                                                "Cases", "Deaths", "Cases", "Deaths",
                                                "Cases", "Deaths", "Cases", "Deaths"), each = nrow(BF)  ))

head(Data4Analysis, 50)
BF




#Section 3.7. Exercise 2
#This code is computer specific.
#On a Mac use:
setwd("/Users/Highstat/applicat/HighlandStatistics/Books/Book3/SolutionExercises")

#On a Windows OS computer use:
setwd("C:/Users/Highstat/applicat/HighlandStatistics/Books/Book3/SolutionExercises")

#You need to replace the entire path by the directory in which you 
#saved the data. 
ISIT <- read.table(file = "ISIT.txt", header = TRUE, dec = ".")
names(ISIT)
str(ISIT)

#data.frame':	789 obs. of  14 variables:
 #$ SampleDepth  : num  517 582 547 614 1068 ...
 #$ Sources      : num  28.7 27.9 23.4 18.3 12.4 ...
 #$ Station      : int  1 1 1 1 1 1 1 1 1 1 ...
 #$ Time         : int  3 3 3 3 3 3 3 3 3 3 ...
 #$ Latitude     : num  50.2 50.2 50.2 50.2 50.2 ...
 #$ Longitude    : num  -14.5 -14.5 -14.5 -14.5 -14.5 ...
 #$ Xkm          : num  -34.1 -34.1 -34.1 -34.1 -34.1 ...
 #$ Ykm          : num  16.8 16.8 16.8 16.8 16.8 ...
 #$ Month        : int  4 4 4 4 4 4 4 4 4 4 ...
 #$ Year         : int  2001 2001 2001 2001 2001 2001 2001 2001 2001 2001 ...
 #$ BottomDepth  : int  3939 3939 3939 3939 3939 3939 3939 3939 3939 3939 ...
 #$ Season       : int  1 1 1 1 1 1 1 1 1 1 ...
 #$ Discovery    : int  252 252 252 252 252 252 252 252 252 252 ...
 #$ RelativeDepth: num  3422 3357 3392 3325 2871 ...
 
#In R, extract the data from station 1. 

ISIT.Station1 <- ISIT[ISIT$Station == 1,]


#How many observations were made at this station? 
nrow(ISIT.Station1)   #Assuming there are no missing values.


#What are the minimum, median, mean, and maximum sampled depth at station 1? 

min(ISIT.Station1$SampleDepth)
median(ISIT.Station1$SampleDepth)
mean(ISIT.Station1$SampleDepth)
max(ISIT.Station1$SampleDepth)



#What are the minimum, median, mean, and maximum sampled depth at station 2? At station 3?
#Repeat the whole proces for station 2..and 3


#Identify any stations with considerably fewer observations. 
nrow(ISIT.Station1)
#And repeat this for each station. 
#At this stage we are trying to convince you that it is worthwhile to read on.
#Later in the book we will use:

tapply(ISIT$Sources, FUN = length, INDEX = ISIT$Station)
# 1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 
#38 44 27  5 12 27 35 34 54 55 53 40 56 58 56 51 47 48 49 
#This is the number of observations per station. But for the moment
#the book ahs only shown you how to do it manually by extracted data from
#each station and use the nrow or length function. Keep on reading the book..:-)


#Create a new data frame omitting these stations.
ISIT2 <- ISIT[ISIT$Station != 4 & ISIT$Station != 5 ,]


#Extract the data from 2002. 
ISIT2[ISIT2$Year == 2002,]

#Extract the data from April (of all years). 
ISIT2[ISIT2$Month == 4,]


#Extract the data that were measured at depths greater than 2000 meters (from all years and months). 

ISIT2Deep <- ISIT2[ISIT2$SampleDepth > 2000,]

#Show the data according to increasing depth values.
I1 <- order(ISIT2Deep$SampleDepth)
ISIT2Deep[I1,]


#Show the data that were measured at depths greater than 2000 meters in April.
ISIT2[ISIT2$SampleDepth > 2000 & ISIT2$Month == 4,]



#Section 3.7. Exercise 3
ISIT2DeepApril <- ISIT2[ISIT2$SampleDepth > 2000 & ISIT2$Month == 4,]
write.table(ISIT2DeepApril, file = "ISIT2DeepApril.txt")


#Section 3.7. Exercise 4
#Using the factor function and accessing subsets of a data frame with deep sea research data.
#Stations 1 through 5 were sampled in April 2001, 
#stations 6 through 11 in August 2001, 
#stations 12 through 15 in March 2002, 
#and stations 16 through 19 in October 2002. 
#Create two new variables in R to identify the month and the year. 
#Note that these are factors. Do this by adding the new variables inside the data frame.

#The ISIT file we gave you already contained this infoâ€¦but let's do it again.

#First create a new variable inside ISIT:
ISIT$NewMonth <- ISIT$SampleDepth   #This just creates it. You can also use: ISIT$NewMonth <- NULL

#Now we can change its values
ISIT$NewMonth[ISIT$Station <= 5] <- "April"
ISIT$NewMonth[ISIT$Station > 5 & ISIT$Station <= 6 ]   <- "August"
ISIT$NewMonth[ISIT$Station > 6 & ISIT$Station <= 11 ]  <- "March"
ISIT$NewMonth[ISIT$Station > 12 & ISIT$Station <= 15 ] <- "March"
ISIT$NewMonth[ISIT$Station > 15 & ISIT$Station <= 19 ] <- "October"
ISIT$NewMonth  #No forgotten rows
ISIT$NewMonth <- factor(ISIT$NewMonth)

#Do something similar for year.







#########################################################################
#Solutions Chapter 4

#Section 4.6. Exercise 1
#This code is computer specific.
#On a Mac use:
setwd("/Users/Highstat/applicat/HighlandStatistics/Books/Book3/SolutionExercises")

#On a Windows OS computer use:
setwd("C:/Users/Highstat/applicat/HighlandStatistics/Books/Book3/SolutionExercises")

#You need to replace the entire path by the directory in which you 
#saved the data. 
TP <- read.table(file = "Temperature.txt", header = TRUE, dec = ".")
names(TP)
str(TP)



#Calculate a one-time series of monthly averages using data from all stations. 
#The end result should be a variable of dimension 16 x 12.

#Clumsy approach:
Temp.YeMo <- matrix(nrow = 16, ncol = 12)
unique(TP$Year)
# [1] 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005

#Get the data from year 1990 and use the tapply function 
TPi <- TP[TP$Year == 1990 ,]
Temp.YeMo[1,] <- tapply(TPi$Temperature, FUN=mean, INDEX =TPi$Month , na.rm = TRUE)
#and repeat that 16 times. Yes..that is clumsy! For the sd and length, just replace the function mean.


#Once you have read Chapter 6 you can use:
Temp.YeMo <- matrix(nrow = 16, ncol = 12)
AllYears <- unique(TP$Year)
for (i in 1:16) {
	ThisYear <- AllYears[i]
	TPi <- TP[TP$Year == ThisYear ,]
    Temp.YeMo[i,] <- tapply(TPi$Temperature, FUN=mean, INDEX =TPi$Month , na.rm = TRUE)
}
Temp.YeMo

#And an even faster approach is:
TP$YeMo <- paste(TP$Year,TP$Month, sep = ".")
MeanYearMonth <- tapply(TP$Temperature, FUN = mean, INDEX = TP$YeMo, na.rm = TRUE)
#Problemâ€¦now you need to convert this into a matrix using the correct (!!!) order of the months and years


#Section 4.6. Exercise 2
#Run the setwd and read.table commands from exercise 4.1
table(TP$Station)
table(TP$Year)
table(TP$Station, TP$Year)




#########################################################################
#Solutions Chapter 5

#Section 5.5. Exercise 1

#The variable, TOT_N, is the number of dead animals at a sampling site, 
#OLIVE is the number of olive groves at a sampling site, and D_Park is 
#the distance from each sampling point to the nearby natural park. 
#Create a plot of TOT_N versus D_park. Use appropriate labels. 
#Add a smoothing curve. Make the same plot again, but use points that 
#are proportional to the value of OLIVE (this may show whether there is an OLIVE effect).

#This code is computer specific.
#On a Mac use:
setwd("/Users/Highstat/applicat/HighlandStatistics/Books/Book3/SolutionExercises")

#On a Windows OS computer use:
setwd("C:/Users/Highstat/applicat/HighlandStatistics/Books/Book3/SolutionExercises")
#You need to replace the entire path by the directory in which you 
#saved the data. 

RK <- read.table(file = "Amphibian_road_Kills.txt", header = TRUE, dec = ".")
names(RK)
#[1] "Sector" "X"      "Y"      "TOT_N"  "OLIVE"  "D_PARK"
str(RK)


plot(x = RK$D_PARK, y = RK$TOT_N, 
     xlab = "Distance to park",
     ylab = "Number of dead animals")

M.Loess <- loess(TOT_N ~ D_PARK, data = RK) 
Fit <- fitted(M.Loess)
Ord1 <- order(RK$D_PARK)
lines(RK$D_PARK[Ord1], Fit[Ord1],
        lwd = 3, lty = 2)

#The choices of 0.5 and 2 were chosen arbitrary
plot(x = RK$D_PARK, y = RK$TOT_N, cex = 0.5 + 2 *RK$OLIVE / max(RK$OLIVE),
     xlab = "Distance to park",
     ylab = "Number of dead animals",
     pch = 16)





#########################################################################
#Solutions Chapter 6

#Section 6.6. Exercise 1
#This code is computer specific.
#On a Mac use:
setwd("/Users/Highstat/applicat/HighlandStatistics/Books/Book3/SolutionExercises")

#On a Windows OS computer use:
setwd("Z:/Users/Highstat/applicat/HighlandStatistics/Books/Book3/SolutionExercises")

#You need to replace the entire path by the directory in which you 
#saved the data. 
TP <- read.table(file = "Temperature.txt", header = TRUE, dec = ".")
names(TP)
str(TP)



AllStations <- unique(TP$Station)
N <- length(AllStations)
for (i in 1:N) {
	Station.i <- as.character(AllStations[i])
	print(Station.i)
	TPi <- TP[TP$Station == Station.i ,]
	YourFileName <- paste(Station.i, ".jpg", sep = "") 
	jpeg(file = YourFileName)
	plot(x = TPi$dDay2 , y = TPi$Temperature, 
	xlab = "Days since 1 January 1990",
	ylab = "Temperature",
	main = Station.i)
	dev.off()
}




#Section 6.6. Exercise 2
Owls <- read.table(file = "Owls.txt", header = TRUE, dec = ".")
names(Owls)
str(Owls)

ifelse(Owls$FoodTreatment == "Satiaded", Owls$NestNight <- paste(Owls$Nest, "1",sep = "_"),
                             Owls$NestNight <- paste(Owls$Nest, "2",sep = "_"))
head(Owls)                             
#You can also do this with: Owls$NestNight <- paste(Owls$Nest, Owls$FoodTreatment,sep = "_") 
         
AllNestsNights <- unique(Owls$NestNight)
N <- length(AllNestsNights)
for (i in 1:N) {
	NestNight.i <- as.character(AllNestsNights[i])
	print(NestNight.i)
	Owlsi <- Owls[Owls$NestNight == NestNight.i ,]
	YourFileName <- paste(NestNight.i, ".jpg", sep = "") 
	#jpeg(file = YourFileName)
	plot(x = Owlsi$ArrivalTime , y = Owlsi$NegPerChick, 
	xlab = "Arrival Time",
	ylab = "Sibling negotiation",
	main = NestNight.i)
	#dev.off()
}
         
         
         
#Section 6.6. Exercise 3
#This is worked out in the theory section



         
                   
#########################################################################
#Solutions Chapter 7                             
#Section 7.10. Exercise 1.

BFDeaths <- read.table(file="BirdfluDeaths.txt", header = TRUE)
#There is a hidden slash after Indonisiaâ€¦.delete it and save the file


Deaths  <- colSums(BFDeaths[,2:16])
Deaths

#Piechart
par(mfrow = c(2,2), mar = c(3, 3, 2, 1))
pie(Deaths , main = "Ordinary pie chart")
pie(Deaths , col = gray(seq(0.4,1.0,length=6)),
    clockwise=TRUE, main = "Grey colours")
pie(Deaths , col = rainbow(6),clockwise = TRUE, main="Rainbow colours")


par(mfrow = c(1,1), mar = c(3, 3, 2, 1))
pie(rowSums(BFDeaths[,2:16]) , col = gray(seq(0.4,1.0,length=6)),
    clockwise=TRUE, main = "Grey colours")




#Section 7.10. Exercise 2.
Veg <- read.table(file="Vegetation2.txt", header = TRUE)

Me <- tapply(Veg$R, Veg$Transect, mean)
Sd <- tapply(Veg$R, Veg$Transect, sd)
Le <- tapply(Veg$R, Veg$Transect, length)
Se <- Sd / sqrt(Le)

cbind(Me, Sd, Le)

bp <- barplot(Me, xlab = "Transect",
	      ylab = "Richness", ylim = c(0,20))

arrows(bp, Me, bp, Me + Sd, lwd = 1.5, angle=90, length=0.1)
box()


plot(x=Veg$Transect, y = jitter(Veg$R),
      pch=1,  xlab = "Transect",
      ylab = "Richness")

points(1:8,Me, pch = 16, cex = 1.5)
arrows(1:8, Me,
       1:8, Me + Se, lwd = 1.5,
       angle=90, length=0.1)

arrows(1:8, Me,
       1:8, Me - Se, lwd = 1.5,
       angle=90, length=0.1)



#Section 7.10. Exercise 3.
boxplot(Veg$R)



#Section 7.10. Exercise 4.
CP <- read.table(file="CodParasite.txt", header = TRUE)
names(CP)
boxplot(Intensity ~ Area, data = CP)
boxplot(Intensity ~ Area * Sex, data = CP)



#Section 7.10. Exercise 5.
Owls <- read.table(file = "Owls.txt", header = TRUE, dec = ".")
names(Owls)
str(Owls)

#Make two Cleveland dotplots of nestling negotiation and arrival time. 

dotchart(Owls$NegPerChick, 
         main ="Negotiation",
         xlab = "Value of variable",
         ylab = "Order of the data")
dotchart(Owls$ArrivalTime,
         main = "Arrival time",
         xlab = "Value of variable",
         ylab = "Order of the data")

#Make a Cleveland dotplot showing arrival time per night. 
dotchart(Owls$ArrivalTime,
         main = "Arrival time",
         xlab = "Value of variable",
         ylab = "Order of the data",
         groups = Owls$FoodTreatment)
#Or use the new variable from Exercise 2 in Section 6.6
#Or use the function dotplot from the lattice package




#Section 7.10. Exercise 6.
CP <- read.table(file="CodParasite.txt", header = TRUE)
names(CP)

dotchart(CP$Intensity, groups = factor(CP$Area))
dotchart(CP$Depth, groups = factor(CP$Prevalence))




#Section 7.10. Exercise 7. In prep
#Section 7.10. Exercise 8. In prep
#Section 7.10. Exercise 9. In prep
#Section 7.10. Exercise 10. In prep





#########################################################################
#Solutions Chapter 8
#This code was provided by Erik Meesters


#Section 8.11. Exercise 1.
library(lattice)
demo(lattice)
ask.old <- par("ask")
par(ask = TRUE)


#Section 8.11. Exercise 2.
#This code is computer specific.
#On a Mac use:
setwd("/Users/Highstat/applicat/HighlandStatistics/Books/Book3/SolutionExercises")
#On a Windows OS computer use:
setwd("Z:/Users/Highstat/applicat/HighlandStatistics/Books/Book3/SolutionExercises")


Data <- read.table("RIKZENV.txt",header=T)
library(lattice)
Data$MyTime <- Data$Year + Data$dDay3 / 365
xyplot(T ~ MyTime | Station, type = "l",
    strip = strip.custom(bg = 'white'),
    col.line = 1, data = Data)


xyplot(T ~ MyTime | Area, type = "l",
    strip = strip.custom(bg = 'white'),
    col.line = 1, data = Data)

I <- order(Data$Area,Data$MyTime)
Data2 <- Data[I,]
xyplot(T ~ MyTime | Area, type = "l",
    strip = strip.custom(bg = 'white'),
    col.line = 1, data = Data2)


xyplot(T ~ MyTime | Area, type = c("g","smooth","l"),
    strip = strip.custom(bg = 'white'),
    col.line = 1, data = Data2)



#Section 8.11. Exercise 3.
  bwplot(T ~ factor(Month) | Area,
    strip = strip.custom(bg = 'white'),
    cex = .5, layout = c(2,5), 
    data = Data, xlab = "Month",
    par.settings = list(box.rectangle=list(col = 1),
    		box.umbrella = list(col= 1),
    		plot.symbol = list (cex=.5, col = 1)))
## |There is a much clearer seasonal pattern and the variation in temperature
## |appears less variable between months and areas.



#Section 8.11. Exercise 4.
dotplot(SAL  ~ factor(Month) | Station,
    strip = strip.custom(bg = 'white'),
    cex=.5,pch=16,
    data = Data, xlab = "Month",
    ylab = "Salinity")


# or better
windows(10,8) #Does not work on a Mac
dotplot(SAL   ~ factor(Month) | Station,
    strip = strip.custom(bg = 'white'),
     scales = list (y = list (relation = "free", 
      cex = .6),x = list (cex = .6)),
    cex = .2,pch=16,
    data = Data, xlab = "Month",
    ylab = "Salinity")



#Section 8.11. Exercise 5.
densityplot( ~ SAL | Station, data = Data,  
    subset=Area=="OS",layout=c(1,4),
    nint=30, xlab = "Salinity")

## Legend and subsets: advanced!
## problem with subsetting is to get rid of unused levels of the grouping factor.
## Auto.key will automatically generate a legend with all stations! Thus we first
## make a subset of the data using the subset function. This still doesn't solve
## the problem. After that we use a little trick, that you will see once and never
## forget: when you display a factor, all levels are displayed at the end of the
## listing; by using [,drop=T], the old levels are dropped. You could also have
## used groups = factor(Station). The most simple solution is to create a new
## dataframe with only the stations from area OS, with only the four stations as
## levels.


densityplot( ~ SAL, data = subset(Data,Area=="OS"),
  groups = Station[,drop = TRUE]    #removes unused levels from levels
  , xlab = "Salinity",
  plot.points = FALSE,
   ref = TRUE,
  auto.key = list(x=.1,y=.8)
  )
  
## Factor works as well, but less elegant.
densityplot( ~ SAL, data = subset(Data,Area=="OS"),
    groups = factor(Station)
    , xlab = "Salinity",
    plot.points = FALSE,
     ref = TRUE,
    auto.key = list(x=.1,y=.8)
    )




#Section 8.11. Exercise 6.
## |Joining the medians is problematic because of NAs
## |Adding na.rm = T to the panel.join function doesn't work
## |made own function and used that.

## | First try: because of NA's only some medians are connected
  bwplot(T ~ factor(Month) | Area,
    strip = strip.custom(bg = 'white'),
    cex = .5, layout = c(2,5), 
    data = Data, xlab = "Month",
    par.settings = list(box.rectangle=list(col = 1),
    		box.umbrella = list(col= 1),
    		plot.symbol = list (cex=.5, col = 1)),
        panel = function(...){
        panel.linejoin(fun = median, col.line = "grey",...)
        panel.bwplot(...)})


## | Taking care of NAs
f2 <- function(x) median(x,na.rm=T)
  bwplot(T ~ factor(Month) | Area,
    strip = strip.custom(bg = 'white'),
    cex = .5, layout = c(2,5), 
    data = Data, xlab = "Month",
    par.settings = list(box.rectangle=list(col = 1),
    		box.umbrella = list(col= 1),
    		plot.symbol = list (cex=.5, col = 1)),
        panel = function(...){
        panel.grid(h = -3, v = -6,...)
        panel.linejoin(fun = f2, col.line = "grey",...)
        panel.bwplot(...)})



#Section 8.11. Exercise 7.
  xyplot(SAL ~ MyTime | Area, type = "l",
    groups = Station, strip = strip.custom(bg = 'white'),
     data = Data, layout = c (2,5))


#Section 8.11. Exercise 8
## |Plotting smoothers and very small points
## |Changing the order of the panels
## |Making a subselection
## |Strips on both sides with different text
  xyplot(T ~ MyTime | Station, type = c("smooth","p"),
    subset=Area=="KZ", span = 1/10,
    as.table = TRUE, pch = ".",
    xlab = "Year", ylab = "Temperature",
    main = "Exercise 8", layout = c(2,3),
    strip = strip.custom(bg = 'white'),
    strip.left=strip.custom(bg = 'white',
      factor.levels = paste ("Area",1:6)),
    col.line = 1, data = Data)



#Section 8.11. Exercise 9.
## | better (see faq on axis scales)
  xyplot(SAL ~ MyTime | Area, type = c("l"), lty = 1,
    groups = Station, data = Data, 
    panel = function(...){
      panel.grid(...,v = -4, h = -3)
      panel.xyplot(...)
    },
    strip = strip.custom(bg = 'white'), 
    par.strip.text = list(cex = .6, lines = 1.2),
    scales = list(y = list(relation = "free", 
        tick.number = 4, cex = 0.6),
      x = list(alternating = c(1,1), at = seq(1990,2005,2.5), 
        labels = c(1990,"",1995,"",2000, "",2005),
        tck = c(1,0), cex = 0.6)),
    layout = c (2,5),
    as.table = T, xlab = "Year", ylab = "Salinity")











## |Extra stuffâ€¦.not part of the exercises
bwplot(SAL ~ factor(Month) | Area,
   strip = strip.custom(bg = 'white'),
   cex = .5, layout = c(2,5),
   data = Data, xlab = "Month", ylab = "Salinity",
   par.settings = list(box.rectangle=list(col = 1),
      box.umbrella = list(col = 1),
      plot.symbol = list (cex =.5, col = 1)),
      col.line = 1,
      panel = function (col.line,...){
      panel.linejoin(fun = f2,col.line="grey",...)
      panel.bwplot(...)})





## | All lattice settings
windows() #Does not work on a Mac
tp <- trellis.par.get()
names.tp <- lapply(tp, names)
unames <- sort(unique(unlist(names.tp)))
ans <- matrix(0, nrow = length(names.tp), ncol = length(unames))
rownames(ans) <- names(names.tp)
colnames(ans) <- unames
for (i in seq(along = names.tp))
ans[i, ] <- as.numeric(unames %in% names.tp[[i]])
ans <- ans[, order(-colSums(ans))]
ans <- ans[order(rowSums(ans)), ]
ans[ans == 0] <- NA
 levelplot(t(ans), colorkey = FALSE,
       scales = list(x = list(rot = 45, cex = 0.8)),
       panel = function(x, y, z, ...)
        { panel.abline(v = unique(as.numeric(x)),
            h = unique(as.numeric(y)),
            col = "darkgrey")
        panel.xyplot(x, y, pch = 16 * z, ...) },
        xlab = "Graphical parameters",
        ylab = "Setting names",
        main = "Settings for Lattice")

par(ask <- ask.old)


