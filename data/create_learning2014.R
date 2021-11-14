#Riikka Narvanen//14.11.2021//Data Wrangling pt.1

lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)

#dimensions and structure of the lrn14 data 
dim(lrn14)
str(lrn14)

#scaling Attitude
attitude <- lrn14$Attitude / 10
attitude

#combining questions
deep_questions <- c("D03", "D06", "D07", "D11", "D14", "D15", "D19", "D22", "D23", "D27", "D30", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26","SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

#creating columns
library(dplyr)

deep_columns <- select(lrn14, one_of(deep_questions))
lrn14$deep <- rowMeans(deep_columns)
lrn14$deep

surface_columns <- select(lrn14, one_of(surface_questions))
lrn14$surf <- rowMeans(surface_columns)

strategic_columns <- select(lrn14, one_of(strategic_questions))
lrn14$stra <- rowMeans(strategic_columns)

#choosing columns
keep_columns <- c("gender","Age","Attitude", "deep", "stra", "surf", "Points")

learning2014 <- select(lrn14, one_of(keep_columns))
learning2014
str(learning2014)

#excluding zero Points
learning2014 <- filter(learning2014, Points > 0)
str(learning2014)

#dataframe

data_frame(learning2014)
df <- tibble(learning2014)
df

write.csv(df, file = "learning2014.csv")
read.csv("learning2014.csv", header = TRUE, sep = ",", quote = "\"", dec = ".", fill = TRUE, comment.char = "")
head(learning2014)
str(learning2014)
