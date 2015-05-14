## Authenticate with twitter API

library(twitteR)
library(ROAuth)
library(plyr)
library(stringr)
library(ggplot2)
library(reshape2)

# install this file:
download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")

api_key <-"11"
api_secret <-"11"
access_token <-"11"
access_token_secret <-"11"

requestURL <- "https://api.twitter.com/oauth/request_token"
accessURL = "https://api.twitter.com/oauth/access_token"
authURL = "http://api.twitter.com/oauth/authorize"
consumerKey = "11"
consumerSecret = "11"


Cred <- OAuthFactory$new(consumerKey=consumerKey,
                         consumerSecret = consumerSecret,
                         requestURL=requestURL,
                         accessURL=accessURL,
                         authURL=authURL)

Cred$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package="RCurl"))
save(Cred, file="twitter_authentication.Rdata")
registerTwitterOAuth(Cred)

# For future use:
load("twitter_authentication.Rdata")

Athletics.list <- searchTwitter('#Athletics', n=1000, cainfo='cacert.pem')
Athletics.df <- twListToDF(Athletics.list)
str(Athletics.df)

# Sentiment Function


                     
