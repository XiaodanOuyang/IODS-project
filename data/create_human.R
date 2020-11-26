Xiaodan Ouyang
human<-read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt")
str(human)
dim(human)
library(stringr)
str(human$GNI)
str_replace(human$GNI, pattern=",", replace ="")%>%as.numeric
keep <- c("Country", "Edu2.FM", "Labo.FM", "Life.Exp", "Edu.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")
human <- select(human, one_of(keep))
str(human)
complete.cases(human)
data.frame(human[-1], comp = complete.cases(human))
human_ <- filter(human, complete.cases(human))
tail(human, 10)
last <- nrow(human) - 7
human_ <- human[1:last, ]
rownames(human) <- human$Country
library(GGally)
dplyr::select()
library(corrplot)
human_ <- select(human, -Country)
str(human_)
ggpairs(human_)


