setwd("D:/SANDY/Enter The Dragon/Data Science")

if(!file.exists("./RERESCH")){dir.create("./RERESCH")}
fileUrl <- "http://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"
download.file(fileUrl,destfile="./RERESCH/RERESCH.zip")

## Unzip dataSet to /data directory
unzip(zipfile="./RERESCH/RERESCH.zip",exdir="./RERESCH")


activity_data <- read.csv("activity.csv")