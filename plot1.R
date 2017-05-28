##Question1 : Examining the decrease in PM2.5 Emissions between 1999-2008

#set the working directory

setwd("C:/Users/b_tug_000/Documents/betitub_github_repo/ExData_week4project")

# download and read the data
dataset <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

download.file(dataset, destfile = "data.zip", method = "auto")
unzip(zipfile = "data.zip", exdir = ".")


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#building up the plot 1

PM25yr <- tapply(NEI$Emissions, NEI$year, sum)


png("plot1.png")
plot(names(PM25yr), PM25yr, type="l", xlab = "Year", ylab = expression
     ("Total" ~ PM[2.5] ~"Emissions (tons)"), main = expression("Total US" ~ 
                                                                  PM[2.5] ~ "Emissions by Year"), col="red")
dev.off()

