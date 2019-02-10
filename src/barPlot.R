# plot Stacked barplot
# created by Yan Gao, 06/14/2017
library(ggplot2)
argv<-commandArgs(trailingOnly = TRUE)

data<-read.table(argv[1], header=T)
fig<-argv[2]

# parameters
# color
color_palatte<-"Set1" # http://mkweb.bcgsc.ca/brewer/swatches/brewer-palettes-swatches.pdf
# font size
font_size=20
font_family="sans"
plot_title="Title"
legend_title="Legend"
xlab="X-label"
ylab="Y-label"


p <- ggplot(data, aes(x=ID, y=Count, fill=Type))
p + geom_col() + # geom_bar(stat="identity")
	ggtitle(plot_title) +
	xlab(xlab) + 
	ylab(ylab) + 
	labs(fill=legend_title) + 
	theme(text=element_text(size=font_size, family=font_family), 
		plot.title = element_text(hjust = 0.5)) + # put title in the center
	scale_fill_brewer(palette = color_palatte) 

ggsave(fig, plot=last_plot(), dpi=300)