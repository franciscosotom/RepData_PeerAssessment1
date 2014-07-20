## Loading and preprocessing the data

# loading data
list.files(path="./Reproducible_Research/RepData_PeerAssessment1")
activitiyZIP <- unz(description="./Reproducible_Research/RepData_PeerAssessment1/activity.zip",
                    filename="activity.csv")
activity <- read.csv(activitiyZIP,na.string="NA")

# Preprocess data
str(activity)
activity$date <- as.Date(activity$date,"%Y-%m-%d")

## What is mean total number of steps taken per day?
# 1.
t.steps.d <- tapply(activity$steps,activity$date,sum)
hist(t.steps.d,main="Histogram\n Total Steps Taken Each Day",xlab="Number of Steps")

#2.
DF1 <- data.frame(mean.per.day=round(tapply(activity$steps,activity$date,mean,na.rm=TRUE),digits=2),
           st_dev.per.day=round(tapply(activity$steps,activity$date,sd,na.rm=TRUE),digits=2))

## What is the average daily activity pattern?
#1.
steps.interval <- tapply(activity$steps,activity$interval,mean,na.rm=TRUE)
plot(steps.interval,type="l",xaxt="n"
     ,xlab="5-minutes Intervals"
     ,ylab="Average Number of Steps"
     ,main="Average Number of Steps\n Each 5-minutes Intervals Across All Days")
axis(side=1,at=1:288,labels=unique(activity$interval))

#2. 
steps.interval[which.max(x=steps.interval)]

## Imputing missing values
#1. 
summary(activity)
table(is.na(activity))

#2.
steps.interval 
# match the interval with the 5-minutes interval average across all dates.
# replace missing value with matched interval step average.


#3.
interval.list <- split(x=activity,f=activity$interval)
for(i in 1:length(interval.list)){
  indicator <- which(is.na(interval.list[[i]]))
  interval.list[[i]][indicator,"steps"] <- round(as.numeric(steps.interval[i]),digits=2)
}
activity2 <- data.frame()
for(i in 1:length(interval.list)){
  activity2 <- rbind(activity2,interval.list[[i]])  
}
activity2[with(activity2,order(date,interval)),]

#4
t.steps.d2 <- tapply(activity2$steps,activity2$date,sum)
hist(t.steps.d2,main="Histogram\n Total Steps Taken Each Day",xlab="Number of Steps")

DF2 <- data.frame(mean.per.day=round(tapply(activity2$steps,activity2$date,mean,na.rm=TRUE),digits=2),
           st_dev.per.day=round(tapply(activity2$steps,activity2$date,sd,na.rm=TRUE),digits=2))

## Are there differences in activity patterns between weekdays and week-ends?

#1. 
activity2$day <- weekdays(x=activity2$date)
head(activity2$day,10)
activity2$week <- ifelse(activity2$day == c("Saturday","Sunday"),"Weekend","Weekday")
activity2$week <- with(activity2,as.factor(x=week))

#2. 
week.list <- split(activity2,activity2$week)
par(mfrow=c(1,2),mar=c(5,4,1,1))
plot(tapply(week.list[[1]]$steps,week.list[[1]]$interval,mean),type="l"
     ,xaxt="n"
     ,ylab="Average Number of Steps"
     ,xlab="5-minutes Intervals"
     ,main="Weekdays")
axis(side=1,at=1:288,labels=unique(activity2$interval))
plot(tapply(week.list[[2]]$steps,week.list[[2]]$interval,mean),type="l"
     ,xaxt="n"
     ,ylab="Average Number of Steps"
     ,xlab="5-minutes Intervals"
     ,main="Weekends")
axis(side=1,at=1:288,labels=unique(activity2$interval))