#Twitter 1 - Working using my Keys
library("curl")
library("twitteR")
library("ROAuth")

download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")

#different for each account
consumerKey="fE7zaOxTAJH7627wv38pB58Vm"
consumerSecret="gSbCyglJ0DAqTN4v2LFPJ4dO2ZtCfAF5sHbJx5yOw4c9jyahPI"
AccessToken="2538628838-qwcsyZSHIeOxkHOE031D2a9YwlRmlladozB0bzq"
AccessTokenSecret="6GY6vdgv6ZY4EWjsctUqChsWJl5wl5TYYrx2OHOl8cof3"


#Commont for all accounts except the keys

cred <- OAuthFactory$new(consumerKey=consumerKey, consumerSecret=consumerSecret, requestURL='https://api.twitter.com/oauth/request_token', accessURL='https://api.twitter.com/oauth/access_token', authURL='https://api.twitter.com/oauth/authorize')


cred$handshake(cainfo="cacert.pem") # it will take browser
save(cred, file="twitter authentication.Rdata") # store this to avoid asking again


#Load saved authentication cert
load("twitter authentication.Rdata")
#registerTwitterOAuth(cred)

setup_twitter_oauth(consumerKey, consumerSecret, AccessToken, AccessTokenSecret)

search.string <- "#CMAP"
no.of.tweets <- 100

searchTwitter(search.string, n=no.of.tweets,lang="en", since='2018-03-22')
tweets <- searchTwitter(search.string, n=no.of.tweets,lang="en")
tweets
homeTimeline(n=15)  #my tweets
mentions(n=15)   # my tags
