# plot Stacked barplot
# created by Yan Gao, 06/15/2017
library(ggplot2)
library(reshape2)
argv<-commandArgs(trailingOnly = TRUE)
data<-read.table(argv[1], header=T, check.names=F)

whole=400000
x<-colnames(data)
Accuracy <- as.numeric(data[4,] / (whole-data[1,]))
Precision <- as.numeric(data[4,] / whole)
all <- data.frame(x, Accuracy, Precision)
all_d <- melt(all, id = "x")
ggplot(all_d, aes(x=x, y=value, group=variable, color=variable))  +
    geom_point(aes(shape=variable)) + 
    geom_line() + ## aes(linetype=variable), size=1
    xlab("MEM length") + 
    ylab("Accuracy and Precision") +        
    theme(legend.position = c(0.8, 0.50)) +  ## position of legend (0,0~1,1)
    theme(legend.title=element_blank())      ## remove legend title

ggsave("scatterPlot.png", plot=last_plot(), dpi=300)
