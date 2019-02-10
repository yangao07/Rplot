# plot Stacked area plot
# created by Yan Gao, 02/10/2019
library(ggplot2)
argv<-commandArgs(trailingOnly = TRUE)

data<-read.table(argv[1], header=T)
fig<-argv[2]

# parameters
# color
color_palatte<-"RdBu" # http://mkweb.bcgsc.ca/brewer/swatches/brewer-palettes-swatches.pdf
# font size
font_size=20
font_family="sans"
plot_title="Title"
legend_title="Legend"
xlab="X-label"
ylab="Y-label"

# data$ID<-log2(data$ID)
# dx$z <- factor(dx$z, levels = rev(levels(dx$z)))
# data <- subset(data, ID<=10)
data$Type <- factor(data$Type, levels = c("T3", "T2", "T1"))
p <- ggplot(data, aes(x=ID, y=Count, fill=Type))
p + geom_area() + # geom_bar(stat="identity")
	ggtitle(plot_title) +
	xlab(xlab) + 
	ylab(ylab) + 
	labs(fill=legend_title) + 
	theme(text=element_text(size=font_size, family=font_family), 
		plot.title = element_text(hjust = 0.5)) + # put title in the center
	scale_fill_brewer(palette = color_palatte) 

ggsave(fig, plot=last_plot(), dpi=300)