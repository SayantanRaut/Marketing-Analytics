install.packages('gsheet')
library('gsheet')
url = 'https://docs.google.com/spreadsheets/d/1PWWoMqE5o3ChwJbpexeeYkW6p4BHL9hubVb1fkKSBgA/edit#gid=216113907'
denco2=as.data.frame(gsheet2tbl(url))
str(denco2)
sales1=read.csv("./data/denco.csv")
head(sales1,8)
tail(sales1,8)
sales=sales1
str(sales)
summary(sales)
dim(sales)
unique(sales$custname)
length(unique(sales$custname))
length(unique(sales$region))

aggregate(sales$revenue,by=list(sales$custname),FUN=max)
df1=aggregate(sales$revenue,by=list(sales$custname),FUN=max)
df1
head(df1)
tail(df1)
df1=df1[order(df1$x,decreasing = TRUE),]
df1
head(df1,5)
df2=aggregate(revenue~custname+region,data=sales,FUN=sum)
df2
head(df2[order(df2$revenue,decreasing = TRUE),],10)

#list
list1=tapply(sales$revenue, sales$custname, FUN=sum)
list1

#dplyr
names(sales)
library('dplyr')
sales %>% dplyr::filter(margin>1000000)

names(sales)
sales %>% group_by(custname) %>%
  summarize(Revenue=sum(revenue)) %>% arrange(desc(Revenue))

sales %>% dplyr::group_by(custname) %>% dplyr::summarise(n=n()) %>% dplyr::arrange(desc(n))

str(sales)
sales %>% dplyr::group_by(custname,region) %>% dplyr::summarise(Revenue=sum(revenue))%>% arrange(desc(Revenue))

sales %>% dplyr::group_by(custname,region) %>% dplyr::summarise(n=n()) %>% dplyr::arrange(desc(n))
