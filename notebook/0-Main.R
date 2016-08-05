library(ggplot2)
library(scales)

#Modifty the bw theme and set it as the defualt
theme_viz <- theme_bw() + theme(
  legend.background = element_rect(fill = "transparent", colour = NA),
  axis.line = element_line(colour = "grey85"),
  panel.background = element_rect(fill = "transparent", colour = NA),
# panel.background = element_rect(fill = rgb(0.97,0.97,0.97, alpha=0.25), colour = NA),
  panel.border = element_rect(colour = NA),
  plot.background = element_rect(fill = "transparent", colour = NA))
theme_set(theme_viz)



# ColorBrewer class for palette PuRd
# http://colorbrewer2.org/?type=sequential&scheme=PuRd&n=7
PuRdclass1 <- "#f1eef6"
PuRdclass2 <- "#d4b9da"
PuRdclass3 <- "#c994c7"
PuRdclass4 <- "#df65b0"
PuRdclass5 <- "#e7298a"
PuRdclass6 <- "#ce1256"
PuRdclass7 <- "#91003f"

