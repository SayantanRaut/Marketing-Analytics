#Twitter 1 - Working using my Keys
library("curl")
library("twitteR")
library("ROAuth")

download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")

#different for each account
consumerKey="VJDjnD46pnZ7KENoj3zOyC600"
consumerSecret="vcE1VBMcdXAjsGe9gTo9fWeqNyG2j8Yzsf4TwQm7jU1n5ttW7u"
AccessToken="2538628838-xLlXXDIhQ9kP0qsf6aq3c64jW6DEnJOxSIwXXIK"
AccessTokenSecret="oJtJDUGZPVhfjhDc1997z0uXsttiFcfJxnScFHGhNu4Kd"


#Commont for all accounts except the keys

cred <- OAuthFactory$new(consumerKey=consumerKey, consumerSecret=consumerSecret, requestURL='https://api.twitter.com/oauth/request_token', accessURL='https://api.twitter.com/oauth/access_token', authURL='https://api.twitter.com/oauth/authorize')


cred$handshake(cainfo="cacert.pem") # it will take browser
save(cred, file="twitter authentication.Rdata") # store this to avoid asking again


#Load saved authentication cert
load("twitter authentication.Rdata")
#registerTwitterOAuth(cred)

setup_twitter_oauth(consumerKey, consumerSecret, AccessToken, AccessTokenSecret)

search.string <- "#businessanalytics"
no.of.tweets <- 100

tweets <- searchTwitter(search.string, n=no.of.tweets,lang="en")
tweets