#Missing values

v1=c(1,2,NA,NA,5)
is.na(v1)
mean(v1,na.rm=T)
na.omit(v1)
anyNA(v1)
v1
v1[is.na(v1)]=mean(v1,na.rm=T)
v1
mean(v1)

#Using VIM package
install.packages('VIM')
library('VIM')
data(sleep,package='VIM')
head(sleep)
dim(sleep)
complete.cases(sleep)
count(sleep[complete.cases(sleep),]) #No. of complete rows
count(sleep[!complete.cases(sleep),]) #No. of imcomplete rows
sum(is.na(sleep$Dream))
mean(is.na(sleep$Dream)) #No. of missing values/Total number of rows
sum(is.na(sleep))
colSums(is.na(sleep))
rowSums(is.na(sleep))
str(sleep)
