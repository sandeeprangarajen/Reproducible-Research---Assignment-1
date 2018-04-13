mean_steps <- mean(activity_steps_day$steps)
median_steps <- median(activity_steps_day$steps)

#we set a normal number format to display the results

mean_steps <- format(mean_steps,digits=1)
median_steps <- format(median_steps,digits=1)