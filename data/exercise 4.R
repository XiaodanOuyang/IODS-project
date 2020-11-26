# access the MASS package
library(MASS)

# load the data
data("Boston")

# explore the dataset
str(Boston)
summary(Boston)

library(corrplot)
# MASS, corrplot, tidyr and Boston dataset are available
library(corrplot)

# calculate the correlation matrix and round it
cor_matrix<-cor(Boston) %>% round(digits = 2)

# print the correlation matrix
cor_matrix

# visualize the correlation matrix
corrplot(cor_matrix, method="circle", type="upper", cl.pos="b", tl.pos="d", tl.cex = 0.6)
# center and standardize variables
boston_scaled <- scale(Boston)

# summaries of the scaled variables
summary(boston_scaled)

# class of the boston_scaled object
class(boston_scaled)

# change the object to data frame
boston_scaled <- as.data.frame(boston_scaled)
# MASS, Boston and boston_scaled are available

# summary of the scaled crime rate

summary(boston_scaled$crim)
# create a quantile vector of crim and print it
bins <- quantile(boston_scaled$crim)
bins
string <-c("low","med_low","med_high","high")
string
# create a categorical variable 'crime'
crime <- cut(boston_scaled$crim, breaks = bins, include.lowest = TRUE,label=string)

# look at the table of the new factor crime
table(crime)

# remove original crim from the dataset
boston_scaled <- dplyr::select(boston_scaled, -crim)
# boston_scaled is available

# number of rows in the Boston dataset 
n <- nrow(boston_scaled)

# choose randomly 80% of the rows
ind <- sample(n,  size = n * 0.8)

# create train set
train <- boston_scaled[ind,]

# create test set 
test <- boston_scaled[-ind,]

# save the correct classes from test data
correct_classes <- test$crime

# remove the crime variable from test data
test <- dplyr::select(test, -crime)
# MASS and train are available

# linear discriminant analysis
lda.fit <- lda(crime ~ ., data = train)

# print the lda.fit object
lda.fit

# the function for lda biplot arrows
lda.arrows <- function(x, myscale = 1, arrow_heads = 0.1, color = "orange", tex = 0.75, choices = c(1,2)){
  heads <- coef(x)
  arrows(x0 = 0, y0 = 0, 
         x1 = myscale * heads[,choices[1]], 
         y1 = myscale * heads[,choices[2]], col=color, length = arrow_heads)
  text(myscale * heads[,choices], labels = row.names(heads), 
       cex = tex, col=color, pos=3)
}