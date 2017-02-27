### Getting Poll Data from 538 ###

## In case not already installed 
rm(list=ls(all=T))
library(foreign)
library(RSelenium)
library(dplyr)

setwd("/Users/veseli/Desktop/R-MeetUp_Scraper")

#us_states_a <- c(1:200,"AL","AK","AZ","AR","CA","CO","CT","DE","DC","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY") 
#us_states <- c("alabama","alaska","arizona","arkansas","california","colorado","connecticut","delaware","district-of-columbia","florida","georgia","hawaii","idaho","illinois","indiana","iowa","kansas","kentucky","louisiana","maine","maryland","massachusetts","michigan","minnesota","mississippi","missouri","montana","nebraska","nevada","new-hampshire","new-jersey","new-mexico","new-york","north-carolina","north-dakota","ohio","oklahoma","oregon","pennsylvania","rhode-island","south-carolina","south-dakota","tennessee","texas","utah","vermont","virginia","washington","west-virginia","wisconsin","wyoming" )
id <- c(1:20851)
date <- c(9999)
clinton <- c(9999)
trumpet <- c(9999)
johnson <- c(9999)
chance_clinton <- c(9999)
chance_trumpet <- c(9999)
chance_johnson <- c(9999)


df = data.frame(id,date,clinton,trumpet,johnson,chance_clinton,chance_trumpet,chance_johnson)

df$state1 <- ifelse(id <= 400, "Alabama", ifelse((id >= 401) & (id <= 801), "Alaska",
             ifelse((id >= 802) & (id <= 1202), "Arizona", ifelse((id >= 1203) & (id <= 1603), "Arkansas",
             ifelse((id >= 1604) & (id <= 2004), "California", ifelse((id >= 2005) & (id <= 2405), "Colorado", 
             ifelse((id >= 2406) & (id <= 2806), "Connecticut", ifelse((id >= 2807) & (id <= 3207), "Delaware",
             ifelse((id >= 3208) & (id <= 3608), "Ditrict-of-Columbia", ifelse((id >= 3609) & (id <= 4009), "Florida",""))))))))))

df$state2 <-    ifelse((id >= 4010) & (id <= 4410), "Georgia", ifelse((id >= 4411) & (id <= 4811), "Hawaii",
                ifelse((id >= 4812) & (id <= 5212), "Idaho", ifelse((id >= 5213) & (id <= 5613), "Illinois", 
                ifelse((id >= 5614) & (id <= 6014), "Indiana", ifelse((id >= 6015) & (id <= 6415), "Iowa", 
                ifelse((id >= 6416) & (id <= 6816), "Kansas", ifelse((id >= 6817) & (id <= 7217), "Kentucky",   
                ifelse((id >= 7218) & (id <= 7618), "Louisiana", ifelse((id >= 7619) & (id <= 8019), "Maine",      
                ifelse((id >= 8020) & (id <= 8420), "Maryland", ifelse((id >= 8421) & (id <= 8821), "Massachusetts",   
                ifelse((id >= 8822) & (id <= 9222), "Michigan", ifelse((id >= 9223) & (id <= 9623), "Minnesota",                                                  
                ifelse((id >= 9624) & (id <= 10024), "Mississippi", ifelse((id >= 10025) & (id <= 10425), "Missouri",                                                  
                ifelse((id >= 10426) & (id <= 10826), "Montana", ifelse((id >= 10827) & (id <= 11227), "Nebraska",
                ifelse((id >= 11228) & (id <= 11628), "Nevada", ifelse((id >= 11629) & (id <= 12029), "New-Hampshire",   
                ifelse((id >= 12030) & (id <= 12430), "New-Jersey", ifelse((id >= 12431) & (id <= 12831), "New-Mexico",   
                ifelse((id >= 12832) & (id <= 13232), "New-York", ifelse((id >= 13233) & (id <= 13633), "North-Carolina",   
                ifelse((id >= 13634) & (id <= 14034), "North-Dakota", ifelse((id >= 14035) & (id <= 14435), "Ohio",   
                ifelse((id >= 14436) & (id <= 14836), "Oklahoma", ifelse((id >= 14837) & (id <= 15237), "Oregon",                                                  
                ifelse((id >= 15238) & (id <= 15638), "Pennsylvania", ifelse((id >= 15639) & (id <= 16039), "Rhode-Island",                                                  
                ifelse((id >= 16040) & (id <= 16440), "South-Carolina", ifelse((id >= 16441) & (id <= 16841), "South-Dakota",
                ifelse((id >= 16842) & (id <= 17242), "Tennessee", ifelse((id >= 17243) & (id <= 17643), "Texas",
                ifelse((id >= 17644) & (id <= 18044), "Utah", ifelse((id >= 18045) & (id <= 18445), "Vermont",                                               
                ifelse((id >= 18446) & (id <= 18846), "Virginia", ifelse((id >= 18847) & (id <= 19247), "Washington",
                ifelse((id >= 19248) & (id <= 19648), "West-Virginia", ifelse((id >= 19649) & (id <= 20049), "Wisconsin", 
                ifelse((id >= 20050) & (id <= 20450), "Wyoming", ifelse((id >= 20451) & (id <= 20851), "National-Polls","" ))))))))))))))))))))))))))))))))))))))))))
                

### APPEND THE STATE VARIABLES ###
df$state <- as.factor(paste(df$state1, df$state2, sep = ""))
df <- subset(df, select = c(id,state, date,clinton,trumpet,johnson,chance_clinton,chance_trumpet,chance_johnson))

### create var with state Abbreviations
#automatically
x <- as.character(df$state)
x <- gsub("-", " ", x, fixed=T)
df$stateshort <- state.abb[match(x,state.name)]
#by hand, inspect
unique(df$state[is.na(df$stateName)])
#df$stateshort[df$state=="Ditrict-of-Columbia"] <- "DC"


### PREPARE THE WEB DRIVER ###
#RSelenium::checkForServer(update=TRUE)
#checkForServer()
#startServer()
#remDr <- remoteDriver(browserName = "chrome")
#remDr$open()

rD <- rsDriver()
remDr <- rD[["client"]]




remDr$navigate("http://projects.fivethirtyeight.com/2016-election-forecast/?ex_cid=rrpromo")

### Find the Poll ###

national <- remDr$findElement(using = 'xpath', value = "/html/body/div[3]/div[3]/ul[3]/li[2]/a/p")
remDr$mouseMoveToLocation(webElement=national)
national$click(buttonId = 0) 
  
beginning <- remDr$findElement(using = 'css selector', value = "#cardsets > div.cardset.current > div > div.cards > div.card.card-poll-chart > svg > g.axis.x > g:nth-child(1) > line")
remDr$mouseMoveToLocation(webElement=beginning)


for(t in 20451:20851)
{ 
  for(m in 4:4){
    remDr$mouseMoveToLocation(x = m, y = 0)
    getDate <- remDr$findElement(using = 'css selector', value = "html body div.main-container.page-US-polls div.screen div#cardsets div.cardset.current div.cardset-inner div.cards div.card.card-poll-chart svg.chart.crosshair g g.date-guide text")
    getShareClinton <- remDr$findElement(using = 'css selector', value = "html body div.main-container.page-US-polls div.screen div#cardsets div.cardset.current div.cardset-inner div.cards div.card.card-poll-chart svg.chart.crosshair g g.candidate.candidate-end.D text.bg tspan.pct")
    getShareTrumpet <- remDr$findElement(using = 'css selector', value = "html body div.main-container.page-US-polls div.screen div#cardsets div.cardset.current div.cardset-inner div.cards div.card.card-poll-chart svg.chart.crosshair g g.candidate.candidate-end.R text.bg tspan.pct")
    getShareJohnson <- remDr$findElement(using = 'css selector', value = "html body div.main-container.page-US-polls div.screen div#cardsets div.cardset.current div.cardset-inner div.cards div.card.card-poll-chart svg.chart.crosshair g g.candidate.candidate-end.L text.bg tspan.pct")
    df$date[t] <- unlist(getDate$getElementText())
    df$clinton[t] <- unlist(getShareClinton$getElementText())
    df$trumpet[t] <- unlist(getShareTrumpet$getElementText())
    df$johnson[t] <- unlist(getShareJohnson$getElementText())
}}


### ALL STATES
container <- data.frame()

for(i in 1:49){
  i <- 1
  stateNameURL <- as.character(unique(df$state)[i]) %>% 
    tolower 
  
  #create subset 
  df.sub <- filter(df, state==as.character(unique(df$state)[i]))
  
  #create and navigate to URL
  URL <- paste0("http://projects.fivethirtyeight.com/2016-election-forecast/", stateNameURL, "/")
  remDr$navigate(URL)
  Sys.sleep(2)
  
  #Create Beginning value
  beginningValue <- paste0("html body div.main-container.page-", unique(df.sub$stateshort) ," div.screen div#cardsets div.cardset.current div.cardset-inner div.cards div.card.card-winprob.card-has-bottom-key.short div.linechart-cards.card div.container.proj div.card.card-inline.winning svg.chart.crosshair g.axis.x g.tick line")
  beginning <- remDr$findElement(using = 'css selector', value = beginningValue)
  remDr$mouseMoveToLocation(webElement=beginning)
  m <- 2
  
  #start loops to fetch actual data
  for(t in 1:dim(df.sub)[1])
  { 
      remDr$mouseMoveToLocation(x = m, y = 0)
      getDate <- remDr$findElement(using = 'css selector', value = paste0("html body div.main-container.page-", unique(df$stateshort)[i] ," div.screen div#cardsets div.cardset.current div.cardset-inner div.cards div.card.card-winprob.card-has-bottom-key.short div.linechart-cards.card div.container.proj div.card.card-inline.winning svg.chart.crosshair g g.date-guide text"))
      getShareClinton <- remDr$findElement(using = 'css selector', value = paste0("html body div.main-container.page-", unique(df$stateshort)[i] ," div.screen div#cardsets div.cardset.current div.cardset-inner div.cards div.card.card-winprob.card-has-bottom-key.short div.linechart-cards.card div.container.proj div.card.card-inline.winning svg.chart.crosshair g g.candidate.candidate-end.D text.bg tspan.pct"))
      getShareTrumpet <- remDr$findElement(using = 'css selector', value = paste0("html body div.main-container.page-", unique(df$stateshort)[i] ," div.screen div#cardsets div.cardset.current div.cardset-inner div.cards div.card.card-winprob.card-has-bottom-key.short div.linechart-cards.card div.container.proj div.card.card-inline.winning svg.chart.crosshair g g.candidate.candidate-end.R text.bg tspan.pct"))
      getShareJohnson <- remDr$findElement(using = 'css selector', value = paste0("html body div.main-container.page-", unique(df$stateshort)[i] ," div.screen div#cardsets div.cardset.current div.cardset-inner div.cards div.card.card-winprob.card-has-bottom-key.short div.linechart-cards.card div.container.proj div.card.card-inline.winning svg.chart.crosshair g g.candidate.candidate-end.L text.bg tspan.pct"))
      getChanceClinton <- remDr$findElement(using = 'css selector', value = paste0("html body div.main-container.page-", unique(df$stateshort)[i] ," div.screen div#cardsets div.cardset.current div.cardset-inner div.cards div.card.card-winprob.card-has-bottom-key.short div.linechart-cards.card div.container.win div.card.card-inline.winning svg.chart.crosshair g g.candidate.candidate-end.D text.bg tspan.pct"))
      getChanceTrumpet <- remDr$findElement(using = 'css selector', value = paste0("html body div.main-container.page-", unique(df$stateshort)[i] ," div.screen div#cardsets div.cardset.current div.cardset-inner div.cards div.card.card-winprob.card-has-bottom-key.short div.linechart-cards.card div.container.win div.card.card-inline.winning svg.chart.crosshair g g.candidate.candidate-end.R text.bg tspan.pct"))
      getChanceJohnson <- remDr$findElement(using = 'css selector', value = paste0("html body div.main-container.page-", unique(df$stateshort)[i] ," div.screen div#cardsets div.cardset.current div.cardset-inner div.cards div.card.card-winprob.card-has-bottom-key.short div.linechart-cards.card div.container.win div.card.card-inline.winning svg.chart.crosshair g g.candidate.candidate-end.L text.bg tspan.pct"))
      df.sub$date[t] <- unlist(getDate$getElementText())
      df.sub$clinton[t] <- unlist(getShareClinton$getElementText())
      df.sub$trumpet[t] <- unlist(getShareTrumpet$getElementText())
      df.sub$johnson[t] <- unlist(getShareJohnson$getElementText())
      df.sub$chance_clinton[t] <- unlist(getChanceClinton$getElementText())
      df.sub$chance_trumpet[t] <- unlist(getChanceTrumpet$getElementText())
      df.sub$chance_johnson[t] <- unlist(getChanceJohnson$getElementText())
    
  }
  
cat("scraped:", as.character(unique(df$state)[i]), "\n")
container <- rbind(container, df.sub)
  
  
}

df <- container


### DROP DUPLICATES (Duplicate dates occur, because the mouse movement is not 100% precise) ###
df <- data.frame(df %>% group_by(state) %>% filter(!duplicated(date)))
### DROP EMPTY CELLS ###
data <- subset(df, date!="")

### SAVE AS .R and .csv DATA FILE ###
save(data, file = "538_polls.RData")
write.csv(data, file = "538_polls.csv")

