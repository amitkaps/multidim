---
layout: default
title: One Dimension Data-Vis
permalink: chapter04
---

# 3. Distribution

When we want to show a person, we take a picture or try to draw a portrait of them. So what does the portrait of a data variable look like? The portrait of a data variable is its distribution - how the values are spread across. So if we can graphically represent the distribution, the shape of the representation is the portrait of the data.

So let us start

## Categorical Variable

For a categorical variable, the value of the variable represents which category it falls under. So the simplest way to develop a portrait would be to count the number of times the variable occurs in each category. So if we take the example of the ```cut``` variable in our ```diamonds``` dataset, we would have the following occurence

| cut   | Fair    | Good   | Very Good  | Premium  |  Ideal  |
|:------|--------:|-------:|-----------:|---------:|--------:|
| count | 1,610   | 4,906  |  12,082    |  13,791  |  21,551 |

### Bar Chart


![]({{ site.baseurl }}/assets/img/cutBar.png)

### Column Chart

```
ggplot(diamonds) + aes(cut) + geom_bar() + coord_flip()
```

![]({{ site.baseurl }}/assets/img/cutColumn.png)

### CoxComb Chart

```
ggplot(diamonds) + aes(cut, fill = cut) + geom_bar(width = 1) + coord_polar()
```

![]({{ site.baseurl }}/assets/img/cutCoxcomb.png)


### Stacked Chart

```
ggplot(diamonds) + aes(x = "", fill = cut) + geom_bar(width = 0.5)
```

![]({{ site.baseurl }}/assets/img/cutStacked.png)

### Pie Chart

```
ggplot(diamonds) + aes(x = "", fill = cut) + geom_bar(width = 1) + coord_polar(theta = "y")
```

![]({{ site.baseurl }}/assets/img/cutPie.png)


## Quantitative Variable

| price | Min.    | 1st Qu | Median   | Mean  |  3rd Qu  | Max.   |
|:------|--------:|-------:|---------:|------:|---------:|-------:|
| $     | 326     | 950    |  2,401   | 3,933 |  5,324   | 18,820 |

### Dotplot

### Histogram

```
ggplot(diamonds) + aes(price) + geom_histogram(binwidth = 50)
```

![]({{ site.baseurl }}/assets/img/priceHist.png)


### Frequency Polygon

```
ggplot(diamonds) + aes(price) + geom_freqpoly(binwidth = 50)
```

![]({{ site.baseurl }}/assets/img/priceFreqpoly.png)

### Density Plot

```
ggplot(diamonds) + aes(price) + geom_density(binwidth = 50)
```

![]({{ site.baseurl }}/assets/img/priceDensity.png)
