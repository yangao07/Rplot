### print read length histogram plot
# created by Yan Gao, 06/14/2017
library(ggplot2)
argv<-commandArgs(trailingOnly = TRUE)

data<-read.table(argv[1])
x<-data[,2] # x<-log(data[,2]), log2/log10
fig<-argv[2]

# parameters
# font
font_size=20
font_family="sans"
# text
plot_title="Title"
legend_title="Legend"
xlab="X-label" 
ylab="Y-label"
# histogram bin
bin_width=100
line_color="black"
fill_color="red"

df<-data.frame(x)
len_max = max(x)
len_min = min(x)

p <- ggplot(df, aes(x=x))
p + geom_histogram(binwidth=bin_width, color=line_color, fill=fill_color) +
	xlim(len_min, len_max) +
	ggtitle(plot_title) +
	xlab(xlab) + 
	ylab(ylab) + 
	theme(text=element_text(size=font_size, family=font_family), 
		plot.title = element_text(hjust = 0.5)) # put title in the center

ggsave(fig, plot=last_plot(), dpi=300)
