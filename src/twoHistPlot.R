### print two histogram plot in one figure
# created by Yan Gao, 07/11/2017
library(ggplot2)
argv<-commandArgs(trailingOnly = TRUE)

data<-read.table(argv[1], header=T)
fig<-argv[2]

# types
t1="T1"
t2="T2"

# parameters
# color
# color_palatte<-"Set1" # http://mkweb.bcgsc.ca/brewer/swatches/brewer-palettes-swatches.pdf
color1="red"
color2="blue"
alpha=0.5
# font size
font_size=20
font_family="sans"
plot_title="Title"
legend_title="Legend"
xlab="X-label"
ylab="Y-label"
# bind width
bind_width=1


ggplot(data, aes(x=Value)) +
    geom_histogram(data=subset(data, Type==t1), fill=color1, binwidth=bind_width, alpha=alpha)  +
    geom_histogram(data=subset(data, Type==t2), fill=color2, binwidth=bind_width, alpha=alpha) +
    ggtitle(plot_title) +
	xlab(xlab) +
	ylab(ylab) +
	labs(fill=legend_title) +
	theme(text=element_text(size=font_size, family=font_family),
		plot.title = element_text(hjust = 0.5)) # put title in the center
ggsave(fig, plot=last_plot(), dpi=300)


# ggplot(all, aes(m, fill = reg)) +
#     geom_histogram(alpha = 0.5, position = 'identity', binwidth=1) +
#     xlab("current") + xlim(90,170)
# ggsave("countTwoHistPlot.png", plot=last_plot(), dpi=300)


# ggplot(dm, aes(m)) + stat_ecdf(geom="step")
# ggsave("meth.png", plot=last_plot(), dpi=300)
#
# ggplot(du, aes(u)) + stat_ecdf(geom="step")
# ggsave("unmeth.png", plot=last_plot(), dpi=300)
