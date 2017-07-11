### print two histogram plot in one figure
# created by Yan Gao, 07/11/2017
library(ggplot2)
argv<-commandArgs(trailingOnly = TRUE)

data1<-read.table(argv[1])
data2<-read.table(argv[2])
m<-data1[,13]
u<-data2[,10]
dm<-data.frame(m)
du<-data.frame(u)
dm$reg<-"meth"
du$reg<-"unmeth"
names(du)<-names(dm)

all<-rbind(dm, du)
ggplot(all, aes(m, fill = reg)) + geom_histogram(alpha = 0.5, aes(y= ..density..), position = 'identity', binwidth=1) + xlab("current") + xlim(90,170)
ggsave("densityTwoHistPlot.png", plot=last_plot(), dpi=300)


#ggplot(all, aes(m, fill = reg)) + geom_histogram(alpha = 0.5, position = 'identity', binwidth=1) + xlab("current") + xlim(90,170)
#ggsave("countTwoHistPlot.png", plot=last_plot(), dpi=300)
