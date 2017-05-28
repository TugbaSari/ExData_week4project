##Question 4: Changes in coal combustion-related Emissions in 1999-2008

#read the data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#required libraries (ggplot2, plyr)
library(ggplot2)
library(plyr)

#building up the plot 4

SCC_sub <- SCC[grepl("Coal" , SCC$Short.Name), ]
NEI_sub <- NEI[NEI$SCC %in% SCC_sub$SCC, ]

png("plot4.png") 
ggplot(NEI_sub, aes(x = factor(year), y = Emissions, fill=year)) +geom_bar(stat = "identity", width = .5) + xlab("year") +ylab("Coal Combustion-Related PM2.5 Emissions") + ggtitle("Total Coal Cumbustion-Related PM2.5 Emissions")
dev.off() 