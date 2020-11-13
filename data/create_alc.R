#XiaodanOuyang 12.11.2020 Exercise3 
#a reference to the data source：Student performance (incl. alcohol consumption)
# access the dplyr library
library(dplyr)
math<-read.csv(file ="data/student-mat.csv",sep = ";" , header=TRUE)
por<-read.csv(file="data/student-por.csv",sep = ";" , header=TRUE)
str(math)
dim(math)
str(por)
dim(por)
# common columns to use as identifiers
join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")
# join the two datasets by the selected identifiers
math_por <- inner_join(math, por, by = join_by)
str(math_por)
dim(math_por)
glimpse(math_por)
# print out the column names of 'math_por'
colnames(math_por)

# create a new data frame with only the joined columns
alc <- select(math_por, one_of(join_by))

# the columns in the datasets which were not used for joining the data
notjoined_columns <- colnames(math)[!colnames(math) %in% join_by]

# print out the columns not used for joining
notjoined_columns 

# for every column name not used for joining...
for(column_name in notjoined_columns) {
  # select two columns from 'math_por' with the same original name
  two_columns <- select(math_por, starts_with(column_name))
  # select the first column vector of those two columns
  first_column <- select(two_columns, 1)[[1]]
  
  # if that first column vector is numeric...
  if(is.numeric(first_column)) {
    # take a rounded average of each row of the two columns and
    # add the resulting vector to the alc data frame
    alc[column_name] <- round(rowMeans(two_columns))
  } else { # else if it's not numeric...
    # add the first column vector to the alc data frame
    alc[column_name] <- first_column
  }
  glimpse(alc)
}
# access the 'tidyverse' packages dplyr and ggplot2
library(dplyr); library(ggplot2)

# define a new column alc_use by combining weekday and weekend alcohol use
alc <- mutate(alc, alc_use = (Dalc + Walc) / 2)
# define a new logical column 'high_use'
alc <- mutate(alc, high_use = alc_use > 2)
glimpse(alc)
write.csv(alc,file ="alc.csv",row.names = FALSE)
alc<-read.csv(file = "data/alc.csv")
glimpse(alc)
