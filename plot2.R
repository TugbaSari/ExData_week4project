##Question 2: Decrease in PM2.5 Emissions in Baltimore City,Maryland from 1999 to 2008

#read the data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#building up the plot 2

baltimore_maryland <- subset (NEI, fips == "24510")
balt_PM25yr <- tapply(baltimore_maryland$Emissions, baltimore_maryland$year, sum)

png("plot2.png")
plot(names(balt_PM25yr), balt_PM25yr, type = "l", xlab="Year", ylab= expression("Total" ~ PM[2.5] ~ "Emissions (tons)"), main=expression("Total for Baltimore City" ~ PM[2.5] ~ "Emissions by Year"), col = "green")
dev.off()     