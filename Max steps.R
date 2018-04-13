#what is the highest steps value? (maximum of steps on one given interval)
max_steps <-max(activity_steps_mean$steps)
#for which interval are the numbers of steps per interval at the highest?
max_interval <- activity_steps_mean$interval[which(activity_steps_mean$steps == max_steps)]
max_steps <- round(max_steps, digits = 2)