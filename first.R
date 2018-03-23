#my first r file
#women
#mtcars

source=c('Anish','Sagar','Nihari','Bhavya','Amber','Sayantan')
courses=c('CSE','CSE','CSE','CSE','CSE','IT')
gender=c('M','M','F','F','M','M')
grades=c('A','S','C','S','A','B')
marks=floor(runif(6,50,100))
df=data.frame(source,courses,gender,grades,marks)
df
df$source=as.character(df$source)
str(df)
df$courses=factor(df$courses)
str(df)
df$grades=factor(df$grades,ordered=T,levels = c('F','E','D','C','B','A','S'))
unique(df$grades)
str(df)
