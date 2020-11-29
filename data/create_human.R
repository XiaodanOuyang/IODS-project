Xiaodan Ouyang
human<-read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt")
names(human)
str(human)
dim(human)
library(stringr)
str(human$GNI)
str_replace(human$GNI, pattern=",", replace ="")%>%as.numeric
library(dplyr)
keep <- c("Country", "Edu2.FM", "Labo.FM", "Life.Exp", "Edu.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")
human <- select(human, one_of(keep))
str(human)
complete.cases(human)
data.frame(human[-1], comp = complete.cases(human))
human_ <- filter(human, complete.cases(human))
human<-human_
tail(human, 10)
last <- nrow(human) - 7
human_ <- human[1:last, ]
rownames(human_) <- human_$Country
library(corrplot)
human <- select(human_,-Country)
library(GGally)
str(human)
human%>% mutate_all(as.numeric) %>%
ggpairs(human)
write.csv(human,file ="data/human.csv",row.names = FALSE)
human<-read.csv(file = "data/human.csv")
