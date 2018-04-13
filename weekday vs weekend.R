#elseif function to categorize Saturday and Sunday as factor level "weekend", all the rest as "weekday"
imputed_activity$dayType <- ifelse(weekdays(as.Date(imputed_activity$date)) == "Samstag" | weekdays(as.Date(imputed_activity$date)) == "Sonntag", "weekend", "weekday")
#transform dayType variable into factor
imputed_activity$dayType <- factor(imputed_activity$dayType)

#Aggregate a table showing mean steps for all intervals, acrlss week days and weekend days
steps_interval_dayType <- aggregate(steps ~ interval + dayType, data = imputed_activity, FUN = mean)
#verify new dataframe 
head(steps_interval_dayType)

#add descriptive variables
names(steps_interval_dayType) <- c("interval", "day_type", "mean_steps")
#plot with ggplot2
library(ggplot2)
plot <- ggplot(steps_interval_dayType, aes(interval, mean_steps))
plot + geom_line(color = "tan3") + facet_grid(day_type~.) + labs(x = "Intervals", y = "Average Steps", title = "Activity Patterns")