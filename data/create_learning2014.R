#XiaodanOuyang 04.11.2020 Start learning R today
# read the data into memory
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)
lrn14
#explore the dimensions of the data
dim(lrn14)
#explore the structure of the data
str(lrn14)
# print the "Attitude" column vector of the lrn14 data
lrn14$Attitude
# print the "gender" column vector of the lrn14 data
lrn14$gender
# print the "Age" column vector of the lrn14 data
lrn14$Age
# print the "Deep" column vector of the lrn14 data
lrn14$Deep
# print the "Stra" column vector of the lrn14 data
lrn14$Stra
lrn14$surf
lrn14$Points
library(dplyr)
# questions related to deep, surface and strategic learning
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

# select the columns related to deep learning and create column 'deep' by averaging
deep_columns <- select(lrn14, one_of(deep_questions))
lrn14$deep <- rowMeans(deep_columns)
lrn14$deep
# select the columns related to surface learning and create column 'surf' by averaging
surface_columns <- select(lrn14, one_of(surface_questions))
lrn14$surf <- rowMeans(surface_columns)
lrn14$surf
# select the columns related to strategic learning and create column 'stra' by averaging
strategic_columns <- select(lrn14, one_of(strategic_questions))
lrn14$stra <- rowMeans(strategic_columns)
lrn14$stra
lrn14
# access the dplyr library
library(dplyr)

# choose a handful of columns to keep
keep_columns <- c("gender","Age","Attitude", "deep", "stra", "surf", "Points")

# select the 'keep_columns' to create a new dataset
learning2014 <- select(lrn14,one_of(keep_columns))

# see the stucture of the new dataset
learning2014
str(learning2014)
dim(learning2014)
# select rows where points is greater than zero
learning2014 <- filter(learning2014,Points>0)
options(max.print=1000000) 
learning2014
dim(learning2014)
write.csv(learning2014,file ="learning2014.csv",row.names = FALSE)
learning2014<-read.csv(file = "data/learning2014.csv")
learning2014
dim(learning2014)

