#### R for Data Science: Data wrangling (Ch. 9-16)

#### Tibbles (Ch. 10) ####

# ** Tibble vs dataframe ----

# A tibble is a dataframe but with some more functionality. Tibble package is part of core tidyverse
library(tidyverse)

# can turn a df into a tibble
as_tibble(iris)

# You can create a new tibble from individual vectors with tibble(). tibble() will automatically recycle inputs of length 1, and allows you to refer to variables that you just created
tibble(
  x = 1:5, 
  y = 1, 
  z = x ^ 2 + y
)

# can have column names that are non-syntactic, but need to surround them with backticks:
tb <- tibble(
  `:)` = "smile", 
  ` ` = "space",
  `2000` = "number"
)
tb

# differences b/w tibbles and dataframes:
  # tibbles only print the first 10 rows by default, and all the columns that fit on the screen
  # each column reports its type
# to change default printing, can print() and control number of rows and width to display:
nycflights13::flights %>% 
  print(n = 10, width = Inf)
# can also cahnge setting options
# options(tibble.print_max = n, tibble.print_min = m): if more than n rows, print only m rows. # Use options(tibble.print_min = Inf) to always show all rows.
# Use options(tibble.width = Inf) to always print all columns, regardless of the width of the screen.
# to change more defaults, look at package?tibble
# could also just use View()

# ** Subsetting ----

df <- tibble(
  x = runif(5),
  y = rnorm(5)
)
View(df)
df$x
df[["x"]]
df[[1]]
# to use in a pipe, will need to use a period as a placeholder
df %>% .$x
# if you have an older function that doesn't work with tibbles, turn tibble back into df:
class(as.data.frame(tb))
  # this is mainly an issue with functions that use [ - this isn't as useful with tidyverse because filter and select are better equivalents. with base R, [ sometimes returns a data frame, and sometimes returns a vector. With tibbles, [ always returns another tibble














