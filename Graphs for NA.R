missing_values <- subset(activity_data, is.na(steps))
#plot repartition, by date or by intervals
par(mfrow = c(2,1), mar = c(2, 2, 1, 1))
hist(missing_values$interval, main="NAs repartition per interval")
hist(as.numeric(missing_values$date), main = "NAs repartion per date", breaks = 61)

----------------------------------------------------------------------------------------------------------------


MeanStepsPerInterval <- tapply(activity_data$steps, activity_data$interval, mean, na.rm = TRUE)
# cut the 'activity' dataset in 2 parts (with and without NAs)
activity_NAs <- activity_data[is.na(activity_data$steps),]
activity_non_NAs <- activity_data[!is.na(activity_data$steps),]
#replace missing values in activity_NAs
activity_NAs$steps <- as.factor(activity_NAs$interval)
levels(activity_NAs$steps) <- MeanStepsPerInterval
#change the vector back as integer 
levels(activity_NAs$steps) <- round(as.numeric(levels(activity_NAs$steps)))
activity_NAs$steps <- as.integer(as.vector(activity_NAs$steps))
#merge/rbind the two datasets together
imputed_activity <- rbind(activity_NAs, activity_non_NAs)

----------------------------------------------------------------------------------------------------------------

#Plotting parameters to place previous histogram and new one next to each other
par(mfrow = c(1,2))
#Plot again the histogram from the first part of the assignment
activity_steps_day <- aggregate(steps ~ date, data = activity_data, FUN = sum, na.rm = TRUE)
hist(activity_steps_day$steps, xlab = "Steps per Day", main = "NAs REMOVED - Total steps/day", col = "wheat")
#Plot new histogram, with imputed missing values
imp_activity_steps_day <- aggregate(steps ~ date, data = imputed_activity, FUN = sum, na.rm = TRUE)
hist(imp_activity_steps_day$steps, xlab = "Steps per Day", main = "NAs IMPUTED - Total steps/day", col = "wheat")