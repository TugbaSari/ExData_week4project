##Question 5: Emissions from motor vehicle sources changed from 1999 - 2008 in Baltimore City

#read the data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#required libraries (ggplot2, plyr)
library(ggplot2)
library(plyr)

#subseting data
mv_source1 <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))
mv_source2 <- SCC[SCC$EI.Sector %in% mv_source1, ]["SCC"]

em_MV_balt <- NEI[NEI$SCC %in% mv_source2$SCC & NEI$fips == "24510",]


bal_mv_pm25 <- ddply(em_MV_balt, .(year), function(x) sum(x$Emissions))
colnames(bal_mv_pm25)[2] <- "Emissions"

#building up the plot 5

png("plot5.png")
qplot(year, Emissions, data=bal_mv_pm25, geom="line", color="orange") + ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))
dev.off()