# Get the defualt ggplot2 theme settings and scale setting
source("Rcode/0-Main.R")

# Get the summary for diamonds$cut
summary(diamonds$cut)

# Set the defualt scale and dataset
g <- ggplot(diamonds) + scale_fill_brewer(palette = "PuRd")

# Bar Chart
cutBar <- g + aes(cut, fill = cut) + geom_bar()
ggsave("assets/img/cutBar.png", cutBar, width = 8, height = 4.5,
       units = "in", bg = "transparent")

# Column Chart
cutColumn <- g + aes(cut, fill = cut) + geom_bar() + coord_flip() 
ggsave("assets/img/cutColumn.png", cutColumn, width = 8, height = 4.5,
       units = "in", bg = "transparent")

# Coxcomb Chart
cutCoxcomb <- g + aes(cut, fill = cut) + geom_bar(width = 1) + 
  coord_polar() +  theme(axis.line = element_blank()) + xlab("")
ggsave("assets/img/cutCoxcomb.png", cutCoxcomb, width = 8, height = 4.5,
       units = "in", bg = "transparent")

# Stacked Chart
cutStacked <- g + aes(x = "", fill = cut) + geom_bar(width = 0.5) + xlab("cut")
ggsave("assets/img/cutStacked.png", cutStacked, width = 8, height = 4.5,
       units = "in", bg = "transparent")

# Pie Chart
cutPie <- g + aes(x = "", fill = cut) + geom_bar() + xlab("cut") + 
  coord_polar(theta = "y") +  theme(axis.line = element_blank()) +
  xlab("")
ggsave("assets/img/cutPie.png", cutPie, width = 8, height = 4.5,
       units = "in", bg = "transparent")


# Quantiative Variable

summary(diamonds$price)

### Dotplot

### Historgram
priceHist <- g + aes(price) + 
  geom_histogram(binwidth = 100, fill = PuRdclass4)
ggsave("assets/img/priceHist.png", priceHist, width = 8, height = 4.5,
       units = "in", bg = "transparent")

### Frequency Polygon
priceFreqpoly <- g + aes(price) + 
  geom_freqpoly(binwidth = 50, color = PuRdclass4)
ggsave("assets/img/priceFreqpoly.png", priceFreqpoly, width = 8, height = 4.5,
       units = "in", bg = "transparent")

### 
priceDensity <- g + aes(price) + 
  geom_density(binwidth = 50, fill = PuRdclass4) +
  scale_y_continuous(labels = comma)
ggsave("assets/img/priceDensity.png", priceDensity, width = 8, height = 4.5,
       units = "in", bg = "transparent")

