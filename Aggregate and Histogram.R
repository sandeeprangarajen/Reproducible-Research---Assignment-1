str(activity_data)

activity_steps_day <- aggregate(steps ~ date, data = activity_data, FUN = sum, na.rm = TRUE)

hist(activity_steps_day$steps, xlab = "Steps per Day", main = "Total number of steps taken per day", col = "wheat")