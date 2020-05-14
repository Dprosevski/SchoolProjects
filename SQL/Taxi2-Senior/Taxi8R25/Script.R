library(dplyr)
library(ggplot2)
plot_list = list()

sPath <- getwd() # get path to Script.R file
cvs <- paste0(sPath, "/NYCTaxi_Sample_Small.csv")
df <- read.csv(cvs)

tripdata <- select(df, PaymentType:Tipped)

trips <- tripdata %>% filter(  PaymentType == "CRD" &
                               FareAmount >= 3 &
                               FareAmount <= 50 &
                               Tipped == 1)

plot_list[[1]] <- ggplot(trips, aes(x = (trips$TotalAmount - trips$TipAmount), y = trips$TipAmount)) +
    geom_smooth() +
    coord_cartesian(xlim = c(0, 60), ylim = c(0, 15)) +
    ggtitle("Relation between Tip amount and Total fare") +
    xlab("Total Fare") +
    ylab("Tip Amount")

linear_model <- lm(trips$TipAmount ~ (trips$TotalAmount - trips$TipAmount), data = trips)
summary(linear_model)
print(linear_model)

TipPercentage <- 100 * trips$TipAmount / (trips$TotalAmount - trips$TipAmount)
head(TipPercentage)
dftips <- data.frame(TipPercentage)

plot_list[[2]] <- ggplot(dftips, aes(dftips$TipPercentage)) +
    geom_histogram(bins = 50) +
    scale_x_continuous(name = "% tip",
                       breaks = seq(0, 50, 20),
                       limits = c(0, 50))

#run these 2 commands in the command line to get both plots
plot_list[[1]]
plot_list[[2]]