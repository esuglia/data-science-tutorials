#### R for Data Science

# download/load necessary packages

install.packages(c("nycflights13", "gapminder", "Lahman"))
library("nycflights13", "gapminder", "Lahman")

# to solve a problem, make a reproducible example or "reprex" and post it in stack overflow. In your reprex, include packages, data, and code. To include data, use dput() to generate the Rcode to recreate it:

dput(mtcars)
mtcars <-
structure(list(mpg = c(21, 21, 22.8, 21.4, 18.7, 18.1, 14.3, 
                       24.4, 22.8, 19.2, 17.8, 16.4, 17.3, 15.2, 10.4, 10.4, 14.7, 32.4, 
                       30.4, 33.9, 21.5, 15.5, 15.2, 13.3, 19.2, 27.3, 26, 30.4, 15.8, 
                       19.7, 15, 21.4), cyl = c(6, 6, 4, 6, 8, 6, 8, 4, 4, 6, 6, 8, 
                                                8, 8, 8, 8, 8, 4, 4, 4, 4, 8, 8, 8, 8, 4, 4, 4, 8, 6, 8, 4), 
               disp = c(160, 160, 108, 258, 360, 225, 360, 146.7, 140.8, 
                        167.6, 167.6, 275.8, 275.8, 275.8, 472, 460, 440, 78.7, 75.7, 
                        71.1, 120.1, 318, 304, 350, 400, 79, 120.3, 95.1, 351, 145, 
                        301, 121), hp = c(110, 110, 93, 110, 175, 105, 245, 62, 95, 
                                          123, 123, 180, 180, 180, 205, 215, 230, 66, 52, 65, 97, 150, 
                                          150, 245, 175, 66, 91, 113, 264, 175, 335, 109), drat = c(3.9, 
                                                                                                    3.9, 3.85, 3.08, 3.15, 2.76, 3.21, 3.69, 3.92, 3.92, 3.92, 
                                                                                                    3.07, 3.07, 3.07, 2.93, 3, 3.23, 4.08, 4.93, 4.22, 3.7, 2.76, 
                                                                                                    3.15, 3.73, 3.08, 4.08, 4.43, 3.77, 4.22, 3.62, 3.54, 4.11
                                          ), wt = c(2.62, 2.875, 2.32, 3.215, 3.44, 3.46, 3.57, 3.19, 
                                                    3.15, 3.44, 3.44, 4.07, 3.73, 3.78, 5.25, 5.424, 5.345, 2.2, 
                                                    1.615, 1.835, 2.465, 3.52, 3.435, 3.84, 3.845, 1.935, 2.14, 
                                                    1.513, 3.17, 2.77, 3.57, 2.78), qsec = c(16.46, 17.02, 18.61, 
                                                                                             19.44, 17.02, 20.22, 15.84, 20, 22.9, 18.3, 18.9, 17.4, 17.6, 
                                                                                             18, 17.98, 17.82, 17.42, 19.47, 18.52, 19.9, 20.01, 16.87, 
                                                                                             17.3, 15.41, 17.05, 18.9, 16.7, 16.9, 14.5, 15.5, 14.6, 18.6
                                                    ), vs = c(0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 
                                                              0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1), am = c(1, 
                                                                                                                      1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 
                                                                                                                      0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1), gear = c(4, 4, 4, 3, 
                                                                                                                                                                    3, 3, 3, 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 4, 4, 4, 3, 3, 3, 
                                                                                                                                                                    3, 3, 4, 5, 5, 5, 5, 5, 4), carb = c(4, 4, 1, 1, 2, 1, 4, 
                                                                                                                                                                                                         2, 2, 4, 4, 3, 3, 3, 4, 4, 4, 1, 2, 1, 1, 2, 2, 4, 2, 1, 
                                                                                                                                                                                                         2, 2, 4, 6, 8, 2)), row.names = c("Mazda RX4", "Mazda RX4 Wag", 
                                                                                                                                                                                                                                           "Datsun 710", "Hornet 4 Drive", "Hornet Sportabout", "Valiant", 
                                                                                                                                                                                                                                           "Duster 360", "Merc 240D", "Merc 230", "Merc 280", "Merc 280C", 
                                                                                                                                                                                                                                           "Merc 450SE", "Merc 450SL", "Merc 450SLC", "Cadillac Fleetwood", 
                                                                                                                                                                                                                                           "Lincoln Continental", "Chrysler Imperial", "Fiat 128", "Honda Civic", 
                                                                                                                                                                                                                                           "Toyota Corolla", "Toyota Corona", "Dodge Challenger", "AMC Javelin", 
                                                                                                                                                                                                                                           "Camaro Z28", "Pontiac Firebird", "Fiat X1-9", "Porsche 914-2", 
                                                                                                                                                                                                                                           "Lotus Europa", "Ford Pantera L", "Ferrari Dino", "Maserati Bora", 
                                                                                                                                                                                                                                           "Volvo 142E"), class = "data.frame")



##### Ch. 3: Data Visualization using ggplot2 #####

library(tidyverse)

# ** First steps ---- 
 
# example with fuel efficiency data: df mpg
mpg
# displ = car's engine size
# hwy: car's fuel efficiency in mpg

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# the basic template for graphing with ggplot2: 
#ggplot(data = <DATA>) + 
#  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

# exercises
ggplot(data = mpg) # creates empty plot
nrow(mpg) # 234 rows
ncol(mpg) # 11 columns
?mpg # drv categorizes car into types based on how it drives: f = front, r = rear, 4 = 4 wheel drive
# make plot of hwy vs cyl
ggplot(data = mpg) +
  geom_point(mapping = aes(x = hwy, y = cyl))
# equivalent:
ggplot(mpg, aes(x = hwy, y = cyl)) +
  geom_point()
# why isn't drv vs class a useful plot?
ggplot(mpg, aes(x = class, y = drv)) +
  geom_point()
  # they're categorical variables
  count(mpg, drv, class) # only a limited number of combos of each value
  
# ** Aesthetic mappings ----
  
# highlight data by class of car by mapping colors of points to class variable
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
# could also highlight by size
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))
  # get a warning because mapping an unordered variable (class) to an ordered aesthetic (size) is not a good idea
# alpha controls transparency
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
# shape controls shape of points
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))
  # but, will only use a max of 6 shapes
# can set properties of aes manually
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

# exercises
# what's wrong with this code?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
  # interprets blue as an aesthetic mapping a variable to a value; treats as a categorical variable; need to put outside of mapping argument
ggplot(mpg, aes(x = displ, y = hwy, colour = displ < 5)) +
  geom_point()
  # Aesthetics can also be mapped to expressions like displ < 5. The ggplot() function behaves as if a temporary variable was added to the data with with values equal to the result of the expression. In this case, the result of displ < 5 is a logical variable which takes values of TRUE or FALSE.

# ** Facets ----

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
# to facet your plot on the combination of two variables, add facet_grid()
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)
# if you prefer to not facet in the rows or columns dimension, use a . instead of a variable name
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(. ~ cyl)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(cyl ~ .)

# ** Geometric objects ----

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
# geom_smooth draws a different line, with a different linetype, for each unique value of the variable that you map to linetype
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv)) # separates linetype based on drv
# examples
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))
ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )
# can add multiple geoms to same plot
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))
# HERE is where we see it could be better to have aes in first line if multiple geoms are plotting the same variables
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()
# or, can specify different data for each layer: smooth line is only for a subset of the dataset
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)

# ** Statistical Transformations ----

# example:
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))
# bar graph uses stat_count as its stat by default, but you can change them - this will produce the same graph:
ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))
# here's an example of why you may want to change the default:
demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")
  # this allows you to map the height of the bars to the raw values of a y variable
# or, you may want to display a bar chart of proportion, rather than count:
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))
# you may want to draw attention to the specific statistical transformations you're doing, for example by using stat_summary:
ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )
# when we used proportions in the bar chart, we needed to set group = 1, or else all the bars in the plot will have the same height, a height of 1. The function geom_bar assumes that the groups are equal to the x values since the stat computes the counts within the group. 

# ** Position Adjustments ----

# you can use fill to color the bars in
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))
# if you map the fill aesthetic to another variable, the bars are automatically stacked:
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))
# position adjustment dictates the stacking - if you don't want stacking, you can use one of three other options; identity, dodge, or fill:
  # identity places each object exactly where it falls on the graph, which causes overlapping bars - use alpha to make the bars slightly transparent, or fill = NA to make the bars completely transparent
  ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
    geom_bar(alpha = 1/5, position = "identity")
  ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
    geom_bar(fill = NA, position = "identity")
  # position = fill works like stacking, but makes each set of stacked bars the same height. This makes it easier to compare proportions across groups
  ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")
  # position = dodge places overlapping objects directly beside one another, which makes it easier to compare individual values
  ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")
# one last useful position adjustment is jitter (for scatter plots)
ggplot(data = mpg) + 
   geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")
  # OR, MORE USEFULLY:
ggplot(data = mpg) + 
  geom_jitter(mapping = aes(x = displ, y = hwy))
# alternatively to jitter, you could use geom_count to give you points that are sized relative to the number of times that particular x-y combination is observed, ie:
ggplot(data = mpg, mapping = aes(x = cty, y = hwy, color = class)) +
  geom_count()
  
# exercises
# turn a stacked bar chart into a pie chart
ggplot(mpg, aes(x = factor(1), fill = drv)) +
  geom_bar()
# theta = y maps y to the angle of each section; if it's not specified the resulting plot is called a bulls-eye
ggplot(mpg, aes(x = factor(1), fill = drv)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y")
ggplot(mpg, aes(x = factor(1), fill = drv)) +
  geom_bar(width = 1) +
  coord_polar()
# labs adds labels and captions
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot() +
  coord_flip() +
  labs(
    y = "Highway MPG",
    x = "Year",
    title = "Highway MPG by car class",
    subtitle = "1999-2008",
    caption = "Source: http://fueleconomy.gov"
  )
# ggtitle adds plot titles

# ** Coordinate systems ----

# coord_flip() switches the xy axes
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot()
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip()
# coord_quickmap() sets the aspect ratio correctly for maps
nz <- map_data("nz")
ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black")
ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black") +
  coord_quickmap()

# exercises
# coord_fixed() ensures that the line produced by geom_abline() is at a 45 degree angle
p <- ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() +
  geom_abline()
p + coord_fixed()

# ** Layered grammar of graphics ----
# New template:
#ggplot(data = <DATA>) + 
#  <GEOM_FUNCTION>(
#    mapping = aes(<MAPPINGS>),
#    stat = <STAT>, 
#position = <POSITION>
#  ) +
#  <COORDINATE_FUNCTION> +
#  <FACET_FUNCTION>



#### Ch. 4: Workflow ####

# if you surround the argument naming an object with parentheses, it will print the object you named
(y <- seq(1, 10, length.out = 5))

# alt shift K gives you a menu with keyboard shortcuts

#### Ch. 5: Data transformation ####

library("nycflights13")
library("tidyverse")

# ** Filter rows with filter() ----
# exercises

# find flights that:
  # had an arrival delay of two or more hours
filter(flights, arr_delay >= 120)
  # flew to Houston (IAH or HOU)
filter(flights, dest == "IAH" | dest == "HOU")
filter(flights, dest %in% c("IAH", "HOU")) # more compact; scales to cases where there are more than two airports we are interested in
  # operated by United, American, or Delta
glimpse(flights) # codes are UA, AA, DL
filter(flights, carrier %in% c("AA", "DL", "UA"))
  # departed in summer (July, Aug, Sept)
filter(flights, month >= 7, month <= 9)
filter(flights, month %in% 7:9) # more compact version
  # arrived more than two hours late, but didn't leave late
filter(flights, arr_delay > 120, dep_delay <= 0)
  # were delayed by at least an hour, but made up over 30 min in flight
filter(flights, dep_delay >= 60, dep_delay - arr_delay > 30)
  # departed between midnight and 6 am
summary(flights$dep_time) # midnight is 2400
filter(flights, dep_time <= 600 | dep_time == 2400)



