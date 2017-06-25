##Question1
Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url = Url, destfile = "C:/Users/sunxi/Coursera/Data_Science/3-week4/class4.csv")
week4 <- read.csv("C:/Users/sunxi/Coursera/Data_Science/3-week4/class4.csv")
library(dplyr)
library(data.table)
week4 <- tbl_df(week4)
name <- names(week4)
name <- strsplit(name,  "wgtp")
name[123]


##Question2
Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url = Url, destfile = "C:/Users/sunxi/Coursera/Data_Science/3-week4/q2.csv")
q2 <- read.csv("C:/Users/sunxi/Coursera/Data_Science/3-week4/q2.csv")
library(dplyr)
library(data.table)
q2 <- tbl_df(q2)
q2 <- q2[-(1:4),1:5]
names(q2) <- c("shortname", "ranking", "x", "countryname", "gdp")
q2 <- q2[, -3]
sum_q2 <- summary(q2$shortname)
q2 <- filter(q2, shortname != "")
q2$gdp <- gsub(",", "", q2$gdp)
q2$gdp <- as.numeric(q2$gdp)
q2_gdp_nona <- filter(q2, !is.na(gdp))
q2_nosum <- filter(q2_gdp_nona, ranking != "")
summarise(q2_nosum, mean(gdp))


##Question3
grep("^United",q2_nosum$countryname)


##Question4
library(dplyr)
library(data.table)
names(q2_nosum) <- c("CountryCode", "ranking", "countryname", "gdp")
gdp <- filter(q2_nosum, !is.na(ranking))
Url_5 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url = Url_5, destfile = "C:/Users/sunxi/Coursera/Data_Science/3-week4/ed.csv")
ed <- read.csv("C:/Users/sunxi/Coursera/Data_Science/3-week4/ed.csv")
ed <- tbl_df(ed)
combined <- full_join(x = gdp, y = ed, by = "CountryCode")
n_fiscal_June <- grep("([Ff]iscal year)+(.*)+([Jj]une)", combined$Special.Notes)
length(n_fiscal_June)


##Question5
install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
