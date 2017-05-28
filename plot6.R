##Question 6: Comparison of emissions from motor vehicle sources in Baltimore City and Los Angeles County

#read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#required libraries (ggplot2, plyr)
library(ggplot2)
library(plyr)
library(grid)

#subsetting the data
mv_source1 <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))
mv_source2 <- SCC[SCC$EI.Sector %in% mv_source1, ]["SCC"]

em_MV_balt <- NEI[NEI$SCC %in% mv_source2$SCC & NEI$fips == "24510",]
em_MV_LA <- NEI[NEI$SCC %in% mv_source2$SCC & NEI$fips == "06037", ]

#binding the data
em_MV_comb <- rbind(em_MV_balt, em_MV_LA)

#emmission due to motor vehicles
em_county <- aggregate (Emissions ~ fips * year, data =em_MV_comb, FUN = sum ) 
em_county$county <- ifelse(em_county$fips == "06037", "Los Angeles", "Baltimore")

#building up the plot 6
png("plot6.png", width=750)
qplot(year, Emissions, data=em_county, geom="line", color=county) + ggtitle(expression("Motor Vehicle Emission Levels" ~ PM[2.5] ~ "  from 1999 to 2008 in Los Angeles County and Baltimore")) + xlab("Year") + ylab(expression("Levels of" ~ PM[2.5] ~ " Emissions"))
dev.off()