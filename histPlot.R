### print read length histogram plot
# created by Yan Gao, 06/14/2017
library(ggplot2)
argv<-commandArgs(trailingOnly = TRUE)

data<-read.table(argv[1])
len<-data[,2]
df<-data.frame(len)
ggplot(df, aes(x=len)) + geom_histogram(binwidth=100, color="black", fill="red") + xlim(0, 100000) + xlab("Read length") + ylab("Read count")

ggsave("histPlot.png", plot=last_plot(), dpi=300)

