#XiaodanOuyang 12.11.2020 Exercise3 
#a reference to the data source：Student performance (incl. alcohol consumption)
# access the dplyr library
library(dplyr)
math<-read.csv(file ="data/student-mat.csv")
por<-read.csv(file="data/student-por.csv")
str(math)
dim(math)
str(por)
dim(por)
# common columns to use as identifiers
join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")
# join the two datasets by the selected identifiers
math_por <- inner_join(math, por, by = join_by)

