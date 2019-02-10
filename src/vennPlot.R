# plot Venn diagram 
# created by Yan Gao, 06/14/2017
library(VennDiagram)
library(RColorBrewer)

argv<-commandArgs(trailingOnly = TRUE)
data<-read.table(argv[1], header=T)
fig<-argv[2]

# parameters
# color
color_palatte<-"Set1" # http://mkweb.bcgsc.ca/brewer/swatches/brewer-palettes-swatches.pdf
fill_color_template=brewer.pal(n = 8, name = color_palatte)
n = 3
fill_color = fill_color_template[1:n]
# font size
font_size=1
font_face="bold"
font_family="sans"
plot_title="Title"
# legend_title="Legend"

t1="T1"
t2="T2"
t3="T3"
l1=as.character(data[data$Type==t1,]$Value)
l2=as.character(data[data$Type==t2,]$Value)
l3=as.character(data[data$Type==t3,]$Value)

venn.diagram(x = list(T1=l1, T2=l2, T3=l3),
            main=plot_title,
            main.cex=font_size, main.fontfamily=font_family, main.fontface = font_face,
            cex = font_size, fontfamily = font_family, fontface = font_face,
            cat.cex = font_size, cat.fontfamily = font_family, cat.fontface = font_face,
            imagetype="png", filename = fig, #main = "Venn diagram of discovered significant micro-exon SE events", main.fontfamily = "sans", main.fontface = "bold",
            fill = fill_color,
            col = "transparent", alpha = 0.50, #cat.col = fill_color,
            ext.text = TRUE)# , cat.cex = 1, cat.pos = c(210,180, 330), cat.dist = c(0.3, 0.4,0.15), rotation.degree = 0, margin = 0.2)
