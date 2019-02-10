# plot scatter and line plot
# created by Yan Gao, 06/15/2017
library(ggplot2)
library(reshape2)
argv<-commandArgs(trailingOnly = TRUE)

data<-read.table(argv[1], header=T)
fig<-argv[2]

# parameters
# color
color_palatte<-"Set1" # http://mkweb.bcgsc.ca/brewer/swatches/brewer-palettes-swatches.pdf
# font
font_size=20
font_family="sans"
# text
plot_title="Title"
legend_title="Legend"
xlab="X-label" 
ylab="Y-label"

p = ggplot(data, aes(x=ID, y=Value, group=Type, color=Type))
p + geom_point(aes(shape=Type)) +
    geom_line() + ## aes(linetype=variable), size=1
    ggtitle(plot_title) +
    xlab(xlab) +
    scale_x_continuous(breaks = seq(min(data$ID), max(data$ID), by = 1)) + # set xticks
    ylab(ylab) +
    labs(fill=legend_title) +
    theme(text=element_text(size=font_size, family=font_family),
    plot.title = element_text(hjust = 0.5)) + # put title in the center
    scale_fill_brewer(palette = color_palatte)

    # theme(legend.position = c(0.8, 0.50)) +  ## position of legend (0,0~1,1)
    # theme(legend.title=element_blank())      ## remove legend title

ggsave(fig, plot=last_plot(), dpi=300)
