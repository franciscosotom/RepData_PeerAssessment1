# Reproducible Research: Peer Assessment 1


## Loading and preprocessing the data
Load dataset:

```r
activitiyZIP <- unz(description = "./activity.zip", filename = "activity.csv")
activity <- read.csv(activitiyZIP, na.string = "NA")
```

Change data format from "Factor" to "Date":

```r
activity$date <- as.Date(activity$date, "%Y-%m-%d")
```


## What is mean total number of steps taken per day?

Total Number of Steps per Day:

```r
t.steps.d <- tapply(activity$steps, activity$date, sum)
hist(t.steps.d, main = "Histogram\n Total Steps Taken Each Day", xlab = "Number of Steps")
```

![plot of chunk TotalStepsDay](figure/TotalStepsDay.png) 


Steps Mean and Standard Deviation per Day:

```r
DF1 <- data.frame(mean.per.day = round(tapply(activity$steps, activity$date, 
    mean, na.rm = TRUE), digits = 2), st_dev.per.day = round(tapply(activity$steps, 
    activity$date, sd, na.rm = TRUE), digits = 2))
library(xtable)
print(xtable(DF1), type = "html")
```

<!-- html table generated in R 3.1.0 by xtable 1.7-3 package -->
<!-- Sun Jul 20 15:00:02 2014 -->
<TABLE border=1>
<TR> <TH>  </TH> <TH> mean.per.day </TH> <TH> st_dev.per.day </TH>  </TR>
  <TR> <TD align="right"> 2012-10-01 </TD> <TD align="right">  </TD> <TD align="right">  </TD> </TR>
  <TR> <TD align="right"> 2012-10-02 </TD> <TD align="right"> 0.44 </TD> <TD align="right"> 6.91 </TD> </TR>
  <TR> <TD align="right"> 2012-10-03 </TD> <TD align="right"> 39.42 </TD> <TD align="right"> 111.90 </TD> </TR>
  <TR> <TD align="right"> 2012-10-04 </TD> <TD align="right"> 42.07 </TD> <TD align="right"> 108.60 </TD> </TR>
  <TR> <TD align="right"> 2012-10-05 </TD> <TD align="right"> 46.16 </TD> <TD align="right"> 120.92 </TD> </TR>
  <TR> <TD align="right"> 2012-10-06 </TD> <TD align="right"> 53.54 </TD> <TD align="right"> 121.20 </TD> </TR>
  <TR> <TD align="right"> 2012-10-07 </TD> <TD align="right"> 38.25 </TD> <TD align="right"> 88.33 </TD> </TR>
  <TR> <TD align="right"> 2012-10-08 </TD> <TD align="right">  </TD> <TD align="right">  </TD> </TR>
  <TR> <TD align="right"> 2012-10-09 </TD> <TD align="right"> 44.48 </TD> <TD align="right"> 130.02 </TD> </TR>
  <TR> <TD align="right"> 2012-10-10 </TD> <TD align="right"> 34.38 </TD> <TD align="right"> 77.08 </TD> </TR>
  <TR> <TD align="right"> 2012-10-11 </TD> <TD align="right"> 35.78 </TD> <TD align="right"> 127.65 </TD> </TR>
  <TR> <TD align="right"> 2012-10-12 </TD> <TD align="right"> 60.35 </TD> <TD align="right"> 155.09 </TD> </TR>
  <TR> <TD align="right"> 2012-10-13 </TD> <TD align="right"> 43.15 </TD> <TD align="right"> 112.94 </TD> </TR>
  <TR> <TD align="right"> 2012-10-14 </TD> <TD align="right"> 52.42 </TD> <TD align="right"> 130.08 </TD> </TR>
  <TR> <TD align="right"> 2012-10-15 </TD> <TD align="right"> 35.20 </TD> <TD align="right"> 119.49 </TD> </TR>
  <TR> <TD align="right"> 2012-10-16 </TD> <TD align="right"> 52.38 </TD> <TD align="right"> 140.80 </TD> </TR>
  <TR> <TD align="right"> 2012-10-17 </TD> <TD align="right"> 46.71 </TD> <TD align="right"> 132.23 </TD> </TR>
  <TR> <TD align="right"> 2012-10-18 </TD> <TD align="right"> 34.92 </TD> <TD align="right"> 121.82 </TD> </TR>
  <TR> <TD align="right"> 2012-10-19 </TD> <TD align="right"> 41.07 </TD> <TD align="right"> 98.06 </TD> </TR>
  <TR> <TD align="right"> 2012-10-20 </TD> <TD align="right"> 36.09 </TD> <TD align="right"> 109.05 </TD> </TR>
  <TR> <TD align="right"> 2012-10-21 </TD> <TD align="right"> 30.63 </TD> <TD align="right"> 83.15 </TD> </TR>
  <TR> <TD align="right"> 2012-10-22 </TD> <TD align="right"> 46.74 </TD> <TD align="right"> 134.04 </TD> </TR>
  <TR> <TD align="right"> 2012-10-23 </TD> <TD align="right"> 30.97 </TD> <TD align="right"> 80.90 </TD> </TR>
  <TR> <TD align="right"> 2012-10-24 </TD> <TD align="right"> 29.01 </TD> <TD align="right"> 81.79 </TD> </TR>
  <TR> <TD align="right"> 2012-10-25 </TD> <TD align="right"> 8.65 </TD> <TD align="right"> 38.73 </TD> </TR>
  <TR> <TD align="right"> 2012-10-26 </TD> <TD align="right"> 23.53 </TD> <TD align="right"> 62.31 </TD> </TR>
  <TR> <TD align="right"> 2012-10-27 </TD> <TD align="right"> 35.14 </TD> <TD align="right"> 98.66 </TD> </TR>
  <TR> <TD align="right"> 2012-10-28 </TD> <TD align="right"> 39.78 </TD> <TD align="right"> 93.18 </TD> </TR>
  <TR> <TD align="right"> 2012-10-29 </TD> <TD align="right"> 17.42 </TD> <TD align="right"> 58.85 </TD> </TR>
  <TR> <TD align="right"> 2012-10-30 </TD> <TD align="right"> 34.09 </TD> <TD align="right"> 96.74 </TD> </TR>
  <TR> <TD align="right"> 2012-10-31 </TD> <TD align="right"> 53.52 </TD> <TD align="right"> 141.10 </TD> </TR>
  <TR> <TD align="right"> 2012-11-01 </TD> <TD align="right">  </TD> <TD align="right">  </TD> </TR>
  <TR> <TD align="right"> 2012-11-02 </TD> <TD align="right"> 36.81 </TD> <TD align="right"> 121.52 </TD> </TR>
  <TR> <TD align="right"> 2012-11-03 </TD> <TD align="right"> 36.70 </TD> <TD align="right"> 95.61 </TD> </TR>
  <TR> <TD align="right"> 2012-11-04 </TD> <TD align="right">  </TD> <TD align="right">  </TD> </TR>
  <TR> <TD align="right"> 2012-11-05 </TD> <TD align="right"> 36.25 </TD> <TD align="right"> 119.56 </TD> </TR>
  <TR> <TD align="right"> 2012-11-06 </TD> <TD align="right"> 28.94 </TD> <TD align="right"> 80.02 </TD> </TR>
  <TR> <TD align="right"> 2012-11-07 </TD> <TD align="right"> 44.73 </TD> <TD align="right"> 124.44 </TD> </TR>
  <TR> <TD align="right"> 2012-11-08 </TD> <TD align="right"> 11.18 </TD> <TD align="right"> 38.16 </TD> </TR>
  <TR> <TD align="right"> 2012-11-09 </TD> <TD align="right">  </TD> <TD align="right">  </TD> </TR>
  <TR> <TD align="right"> 2012-11-10 </TD> <TD align="right">  </TD> <TD align="right">  </TD> </TR>
  <TR> <TD align="right"> 2012-11-11 </TD> <TD align="right"> 43.78 </TD> <TD align="right"> 113.63 </TD> </TR>
  <TR> <TD align="right"> 2012-11-12 </TD> <TD align="right"> 37.38 </TD> <TD align="right"> 117.25 </TD> </TR>
  <TR> <TD align="right"> 2012-11-13 </TD> <TD align="right"> 25.47 </TD> <TD align="right"> 64.41 </TD> </TR>
  <TR> <TD align="right"> 2012-11-14 </TD> <TD align="right">  </TD> <TD align="right">  </TD> </TR>
  <TR> <TD align="right"> 2012-11-15 </TD> <TD align="right"> 0.14 </TD> <TD align="right"> 2.00 </TD> </TR>
  <TR> <TD align="right"> 2012-11-16 </TD> <TD align="right"> 18.89 </TD> <TD align="right"> 62.52 </TD> </TR>
  <TR> <TD align="right"> 2012-11-17 </TD> <TD align="right"> 49.79 </TD> <TD align="right"> 145.66 </TD> </TR>
  <TR> <TD align="right"> 2012-11-18 </TD> <TD align="right"> 52.47 </TD> <TD align="right"> 141.65 </TD> </TR>
  <TR> <TD align="right"> 2012-11-19 </TD> <TD align="right"> 30.70 </TD> <TD align="right"> 120.22 </TD> </TR>
  <TR> <TD align="right"> 2012-11-20 </TD> <TD align="right"> 15.53 </TD> <TD align="right"> 54.66 </TD> </TR>
  <TR> <TD align="right"> 2012-11-21 </TD> <TD align="right"> 44.40 </TD> <TD align="right"> 141.77 </TD> </TR>
  <TR> <TD align="right"> 2012-11-22 </TD> <TD align="right"> 70.93 </TD> <TD align="right"> 153.56 </TD> </TR>
  <TR> <TD align="right"> 2012-11-23 </TD> <TD align="right"> 73.59 </TD> <TD align="right"> 175.27 </TD> </TR>
  <TR> <TD align="right"> 2012-11-24 </TD> <TD align="right"> 50.27 </TD> <TD align="right"> 147.88 </TD> </TR>
  <TR> <TD align="right"> 2012-11-25 </TD> <TD align="right"> 41.09 </TD> <TD align="right"> 98.31 </TD> </TR>
  <TR> <TD align="right"> 2012-11-26 </TD> <TD align="right"> 38.76 </TD> <TD align="right"> 118.01 </TD> </TR>
  <TR> <TD align="right"> 2012-11-27 </TD> <TD align="right"> 47.38 </TD> <TD align="right"> 143.29 </TD> </TR>
  <TR> <TD align="right"> 2012-11-28 </TD> <TD align="right"> 35.36 </TD> <TD align="right"> 129.01 </TD> </TR>
  <TR> <TD align="right"> 2012-11-29 </TD> <TD align="right"> 24.47 </TD> <TD align="right"> 81.47 </TD> </TR>
  <TR> <TD align="right"> 2012-11-30 </TD> <TD align="right">  </TD> <TD align="right">  </TD> </TR>
   </TABLE>


## What is the average daily activity pattern?


```r
steps.interval <- tapply(activity$steps, activity$interval, mean, na.rm = TRUE)
plot(steps.interval, type = "l", xaxt = "n", xlab = "5-minutes Intervals", ylab = "Average Number of Steps", 
    main = "Average Number of Steps\n Each 5-minutes Intervals Across All Days")
axis(side = 1, at = 1:288, labels = unique(activity$interval))
```

![plot of chunk DailyPAttern](figure/DailyPAttern.png) 

5-minutes interval with maximum number of steps:

```r
print(steps.interval[which.max(x = steps.interval)])
```

```
##   835 
## 206.2
```


## Imputing missing values


```r
print(summary(activity))
```

```
##      steps            date               interval   
##  Min.   :  0.0   Min.   :2012-10-01   Min.   :   0  
##  1st Qu.:  0.0   1st Qu.:2012-10-16   1st Qu.: 589  
##  Median :  0.0   Median :2012-10-31   Median :1178  
##  Mean   : 37.4   Mean   :2012-10-31   Mean   :1178  
##  3rd Qu.: 12.0   3rd Qu.:2012-11-15   3rd Qu.:1766  
##  Max.   :806.0   Max.   :2012-11-30   Max.   :2355  
##  NA's   :2304
```

*Total number of NA's = 2304*


Stretegy:  
1. Match the interval with the 5-minutes interval average across all dates.  
2. Replace missing value with matched interval step average.

```r
interval.list <- split(x = activity, f = activity$interval)
for (i in 1:length(interval.list)) {
    indicator <- which(is.na(interval.list[[i]]))
    interval.list[[i]][indicator, "steps"] <- round(as.numeric(steps.interval[i]), 
        digits = 2)
}
activity2 <- data.frame()
for (i in 1:length(interval.list)) {
    activity2 <- rbind(activity2, interval.list[[i]])
}
activity2[with(activity2, order(date, interval)), ]
```



```r
t.steps.d2 <- tapply(activity2$steps, activity2$date, sum)
hist(t.steps.d2, main = "Histogram\n Total Steps Taken Each Day", xlab = "Number of Steps")
```

![plot of chunk Histogram2](figure/Histogram2.png) 



```r
DF2 <- data.frame(mean.per.day = round(tapply(activity2$steps, activity2$date, 
    mean, na.rm = TRUE), digits = 2), st_dev.per.day = round(tapply(activity2$steps, 
    activity2$date, sd, na.rm = TRUE), digits = 2))
library(xtable)
print(xtable(DF2), type = "html")
```

<!-- html table generated in R 3.1.0 by xtable 1.7-3 package -->
<!-- Sun Jul 20 15:00:06 2014 -->
<TABLE border=1>
<TR> <TH>  </TH> <TH> mean.per.day </TH> <TH> st_dev.per.day </TH>  </TR>
  <TR> <TD align="right"> 2012-10-01 </TD> <TD align="right"> 37.38 </TD> <TD align="right"> 38.66 </TD> </TR>
  <TR> <TD align="right"> 2012-10-02 </TD> <TD align="right"> 0.44 </TD> <TD align="right"> 6.91 </TD> </TR>
  <TR> <TD align="right"> 2012-10-03 </TD> <TD align="right"> 39.42 </TD> <TD align="right"> 111.90 </TD> </TR>
  <TR> <TD align="right"> 2012-10-04 </TD> <TD align="right"> 42.07 </TD> <TD align="right"> 108.60 </TD> </TR>
  <TR> <TD align="right"> 2012-10-05 </TD> <TD align="right"> 46.16 </TD> <TD align="right"> 120.92 </TD> </TR>
  <TR> <TD align="right"> 2012-10-06 </TD> <TD align="right"> 53.54 </TD> <TD align="right"> 121.20 </TD> </TR>
  <TR> <TD align="right"> 2012-10-07 </TD> <TD align="right"> 38.25 </TD> <TD align="right"> 88.33 </TD> </TR>
  <TR> <TD align="right"> 2012-10-08 </TD> <TD align="right"> 37.38 </TD> <TD align="right"> 38.66 </TD> </TR>
  <TR> <TD align="right"> 2012-10-09 </TD> <TD align="right"> 44.48 </TD> <TD align="right"> 130.02 </TD> </TR>
  <TR> <TD align="right"> 2012-10-10 </TD> <TD align="right"> 34.38 </TD> <TD align="right"> 77.08 </TD> </TR>
  <TR> <TD align="right"> 2012-10-11 </TD> <TD align="right"> 35.78 </TD> <TD align="right"> 127.65 </TD> </TR>
  <TR> <TD align="right"> 2012-10-12 </TD> <TD align="right"> 60.35 </TD> <TD align="right"> 155.09 </TD> </TR>
  <TR> <TD align="right"> 2012-10-13 </TD> <TD align="right"> 43.15 </TD> <TD align="right"> 112.94 </TD> </TR>
  <TR> <TD align="right"> 2012-10-14 </TD> <TD align="right"> 52.42 </TD> <TD align="right"> 130.08 </TD> </TR>
  <TR> <TD align="right"> 2012-10-15 </TD> <TD align="right"> 35.20 </TD> <TD align="right"> 119.49 </TD> </TR>
  <TR> <TD align="right"> 2012-10-16 </TD> <TD align="right"> 52.38 </TD> <TD align="right"> 140.80 </TD> </TR>
  <TR> <TD align="right"> 2012-10-17 </TD> <TD align="right"> 46.71 </TD> <TD align="right"> 132.23 </TD> </TR>
  <TR> <TD align="right"> 2012-10-18 </TD> <TD align="right"> 34.92 </TD> <TD align="right"> 121.82 </TD> </TR>
  <TR> <TD align="right"> 2012-10-19 </TD> <TD align="right"> 41.07 </TD> <TD align="right"> 98.06 </TD> </TR>
  <TR> <TD align="right"> 2012-10-20 </TD> <TD align="right"> 36.09 </TD> <TD align="right"> 109.05 </TD> </TR>
  <TR> <TD align="right"> 2012-10-21 </TD> <TD align="right"> 30.63 </TD> <TD align="right"> 83.15 </TD> </TR>
  <TR> <TD align="right"> 2012-10-22 </TD> <TD align="right"> 46.74 </TD> <TD align="right"> 134.04 </TD> </TR>
  <TR> <TD align="right"> 2012-10-23 </TD> <TD align="right"> 30.97 </TD> <TD align="right"> 80.90 </TD> </TR>
  <TR> <TD align="right"> 2012-10-24 </TD> <TD align="right"> 29.01 </TD> <TD align="right"> 81.79 </TD> </TR>
  <TR> <TD align="right"> 2012-10-25 </TD> <TD align="right"> 8.65 </TD> <TD align="right"> 38.73 </TD> </TR>
  <TR> <TD align="right"> 2012-10-26 </TD> <TD align="right"> 23.53 </TD> <TD align="right"> 62.31 </TD> </TR>
  <TR> <TD align="right"> 2012-10-27 </TD> <TD align="right"> 35.14 </TD> <TD align="right"> 98.66 </TD> </TR>
  <TR> <TD align="right"> 2012-10-28 </TD> <TD align="right"> 39.78 </TD> <TD align="right"> 93.18 </TD> </TR>
  <TR> <TD align="right"> 2012-10-29 </TD> <TD align="right"> 17.42 </TD> <TD align="right"> 58.85 </TD> </TR>
  <TR> <TD align="right"> 2012-10-30 </TD> <TD align="right"> 34.09 </TD> <TD align="right"> 96.74 </TD> </TR>
  <TR> <TD align="right"> 2012-10-31 </TD> <TD align="right"> 53.52 </TD> <TD align="right"> 141.10 </TD> </TR>
  <TR> <TD align="right"> 2012-11-01 </TD> <TD align="right"> 37.38 </TD> <TD align="right"> 38.66 </TD> </TR>
  <TR> <TD align="right"> 2012-11-02 </TD> <TD align="right"> 36.81 </TD> <TD align="right"> 121.52 </TD> </TR>
  <TR> <TD align="right"> 2012-11-03 </TD> <TD align="right"> 36.70 </TD> <TD align="right"> 95.61 </TD> </TR>
  <TR> <TD align="right"> 2012-11-04 </TD> <TD align="right"> 37.38 </TD> <TD align="right"> 38.66 </TD> </TR>
  <TR> <TD align="right"> 2012-11-05 </TD> <TD align="right"> 36.25 </TD> <TD align="right"> 119.56 </TD> </TR>
  <TR> <TD align="right"> 2012-11-06 </TD> <TD align="right"> 28.94 </TD> <TD align="right"> 80.02 </TD> </TR>
  <TR> <TD align="right"> 2012-11-07 </TD> <TD align="right"> 44.73 </TD> <TD align="right"> 124.44 </TD> </TR>
  <TR> <TD align="right"> 2012-11-08 </TD> <TD align="right"> 11.18 </TD> <TD align="right"> 38.16 </TD> </TR>
  <TR> <TD align="right"> 2012-11-09 </TD> <TD align="right"> 37.38 </TD> <TD align="right"> 38.66 </TD> </TR>
  <TR> <TD align="right"> 2012-11-10 </TD> <TD align="right"> 37.38 </TD> <TD align="right"> 38.66 </TD> </TR>
  <TR> <TD align="right"> 2012-11-11 </TD> <TD align="right"> 43.78 </TD> <TD align="right"> 113.63 </TD> </TR>
  <TR> <TD align="right"> 2012-11-12 </TD> <TD align="right"> 37.38 </TD> <TD align="right"> 117.25 </TD> </TR>
  <TR> <TD align="right"> 2012-11-13 </TD> <TD align="right"> 25.47 </TD> <TD align="right"> 64.41 </TD> </TR>
  <TR> <TD align="right"> 2012-11-14 </TD> <TD align="right"> 37.38 </TD> <TD align="right"> 38.66 </TD> </TR>
  <TR> <TD align="right"> 2012-11-15 </TD> <TD align="right"> 0.14 </TD> <TD align="right"> 2.00 </TD> </TR>
  <TR> <TD align="right"> 2012-11-16 </TD> <TD align="right"> 18.89 </TD> <TD align="right"> 62.52 </TD> </TR>
  <TR> <TD align="right"> 2012-11-17 </TD> <TD align="right"> 49.79 </TD> <TD align="right"> 145.66 </TD> </TR>
  <TR> <TD align="right"> 2012-11-18 </TD> <TD align="right"> 52.47 </TD> <TD align="right"> 141.65 </TD> </TR>
  <TR> <TD align="right"> 2012-11-19 </TD> <TD align="right"> 30.70 </TD> <TD align="right"> 120.22 </TD> </TR>
  <TR> <TD align="right"> 2012-11-20 </TD> <TD align="right"> 15.53 </TD> <TD align="right"> 54.66 </TD> </TR>
  <TR> <TD align="right"> 2012-11-21 </TD> <TD align="right"> 44.40 </TD> <TD align="right"> 141.77 </TD> </TR>
  <TR> <TD align="right"> 2012-11-22 </TD> <TD align="right"> 70.93 </TD> <TD align="right"> 153.56 </TD> </TR>
  <TR> <TD align="right"> 2012-11-23 </TD> <TD align="right"> 73.59 </TD> <TD align="right"> 175.27 </TD> </TR>
  <TR> <TD align="right"> 2012-11-24 </TD> <TD align="right"> 50.27 </TD> <TD align="right"> 147.88 </TD> </TR>
  <TR> <TD align="right"> 2012-11-25 </TD> <TD align="right"> 41.09 </TD> <TD align="right"> 98.31 </TD> </TR>
  <TR> <TD align="right"> 2012-11-26 </TD> <TD align="right"> 38.76 </TD> <TD align="right"> 118.01 </TD> </TR>
  <TR> <TD align="right"> 2012-11-27 </TD> <TD align="right"> 47.38 </TD> <TD align="right"> 143.29 </TD> </TR>
  <TR> <TD align="right"> 2012-11-28 </TD> <TD align="right"> 35.36 </TD> <TD align="right"> 129.01 </TD> </TR>
  <TR> <TD align="right"> 2012-11-29 </TD> <TD align="right"> 24.47 </TD> <TD align="right"> 81.47 </TD> </TR>
  <TR> <TD align="right"> 2012-11-30 </TD> <TD align="right"> 37.38 </TD> <TD align="right"> 38.66 </TD> </TR>
   </TABLE>


## Are there differences in activity patterns between weekdays and weekends?


```r
activity2$day <- weekdays(x = activity2$date)
head(activity2$day, 10)
activity2$week <- ifelse(activity2$day == c("Saturday", "Sunday"), "Weekend", 
    "Weekday")
activity2$week <- with(activity2, as.factor(x = week))
```



```r
week.list <- split(activity2, activity2$week)
par(mfrow = c(1, 2), mar = c(5, 4, 1, 1))
plot(tapply(week.list[[1]]$steps, week.list[[1]]$interval, mean), type = "l", 
    xaxt = "n", ylab = "Average Number of Steps", xlab = "5-minutes Intervals", 
    main = "Weekdays")
axis(side = 1, at = 1:288, labels = unique(activity2$interval))
plot(tapply(week.list[[2]]$steps, week.list[[2]]$interval, mean), type = "l", 
    xaxt = "n", ylab = "Average Number of Steps", xlab = "5-minutes Intervals", 
    main = "Weekends")
axis(side = 1, at = 1:288, labels = unique(activity2$interval))
```

![plot of chunk plotsbyweekinfo](figure/plotsbyweekinfo.png) 

