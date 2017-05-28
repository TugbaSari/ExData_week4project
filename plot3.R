##Question 3: Decrease PM2.5 Emissions in Baltimore City By Source: 1999-2008

#read the data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#required libraries (ggplot2, plyr)
library(ggplot2)
library(plyr)

#building up the plot 3
baltimore <- subset (NEI, fips == "24510")
type_PM25_year <- ddply(baltimore, .(year, type), function(x) sum(x$Emissions))

colnames(type_PM25_year)[3] <- "Emissions"
png("plot3.png") 
qplot(year, Emissions, data=type_PM25_year, color=type, geom ="line") + ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Emmission by source, type and year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (in tons)"))
dev.off()