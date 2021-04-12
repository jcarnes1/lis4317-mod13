install.packages("gapminder")
install.packages("ggplot2")
install.packages("gganimate")
install.packages("gifski")
install.packages("animation")
library(animation)
library(gapminder)
library(ggplot2)
library(gganimate)
library(gifski)

#data found from gapminder package
data("gapminder")
gapminderData <- gapminder

plotData <- ggplot(data1, aes(x=gdpPercap,y=lifeExp,
                                col=continent,
                                size=pop) ) +
  guides(col=F) +
  labs(size="Population") +
  geom_point() +
  facet_wrap(~continent) +
  scale_x_log10() +
  labs(title = "Gapminder : Data From 1952 - 2007",
       subtitle = "Year: {frame_time}",
       caption = "From the R gapminder dataset",
       x = "GDP per Capita (log scale)",
       y = "Life Expectancy") +
  theme_bw()

plotData

plotAnimation <- plotData +
  transition_states(gapminderData$continent,
                    transition_length = 10,
                    state_length = 5) +
  transition_time(gapminderData$year)

plotAnimation

saveGIF({
  for (i in 1:10) plot(runif(10), ylim = 0:1)
})
