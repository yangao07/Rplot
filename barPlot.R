# plot Stacked barplot
# created by Yan Gao, 06/14/2017
library(ggplot2)
argv<-commandArgs(trailingOnly = TRUE)
color_palatte<-"Set1" # http://mkweb.bcgsc.ca/brewer/swatches/brewer-palettes-swatches.pdf


data<-read.table(argv[1], header=T, check.names = F)
nrow=nrow(data)
ncol=ncol(data)

## condition
condition<-rownames(data)

## xlabel
xlabel<-NULL
for (i in 1:ncol) {
  xlabel <- append(xlabel, rep(colnames(data)[i], 4))
}
## ylabell
ylabel<-NULL
for (i in 1:ncol) {
  ylabel <- append(ylabel, data[,i])
}

all <- data.frame(xlabel, ylabel, condition)
all$condition<-factor(condition, levels(all$condition)[c(1,3,4,2)]) # TODO

ggplot(all, aes(x = xlabel, y = ylabel, fill=condition)) + 
  geom_bar(stat="identity") +
  scale_fill_brewer(palette = color_palatte)
ggsave("barplot.png", plot=last_plot(), dpi=300)
