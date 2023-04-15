###This project is based on the dataset provided in: https://www.udemy.com/course/r-programming/ 
##This project is simply an exercise to explore data, filter it, and create an appropriate visualization


#First import the data
data <- read.csv("Section6-Homework-Data.csv", stringsAsFactors = T)

#Explore the data
nrow(data)
ncol(data)
head(data)
str(data)
summary(data)

##Activate ggplot2 (of course after installing it first)
#install.packages("ggplot2")
#library(ggplot2)

#Make desired filter then apply to the data and create a new one
filt1 <- (data$Genre == "action") | (data$Genre == "adventure") | (data$Genre == "animation") | (data$Genre == "comedy") | (data$Genre == "drama")

filt2 <- data$Studio %in% c("Buena Vista Studios", "Fox", "Paramount Pictures", "Sony", "Universal", "WB")

filt_data = data[filt1 & filt2,]

#Use the filtered data as the "data"
plot = ggplot(data = filt_data, aes(x = Genre, y = Gross...US))

#Create the visualization
viz <- plot + 
  geom_jitter(aes(size = Budget...mill., colour = Studio)) +
  geom_boxplot(alpha = 0.7, outlier.colour = NA)

viz <- viz +
  xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre")

viz$labels$size <- "Budget $M"

viz <- viz +
  theme(
    axis.title.x = element_text(colour = "Blue", size = 20),
    axis.title.y = element_text(colour = "Blue", size = 20),
    axis.text.x = element_text(size = 10),
    axis.text.y = element_text(size = 10),
    legend.title = element_text(size = 10),
    legend.text = element_text(size = 7),
    plot.title = element_text(size = 25)
  )

viz