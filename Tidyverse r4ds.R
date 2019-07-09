library(tidyverse)
library(ggplot2)
setwd("~/Box Sync/Graduate School/Lassen Snowmelt & Phenology/Data")

##### General Notes on Tidyverse from article "Tidy data" published in the Journal of Statistical Software #####

# in tidy data:
#    1. each variable forms a column
#    2. each observation forms a row
#    3. each type of observational unit forms a table

# example:
#  person        treatment   result
#  John Smith        a        X
#  Jane Doe          a        16
#  Mary Johnson      a        3
#  John Smith        b        2
#  Jane Doe          b        11
#  Mary Johnson      b        1

###### R for Data Science Ch. 12: Tidyverse ######

## Book found here: https://r4ds.had.co.nz/tidy-data.html

## Outline:
  # Tidy data
  # Spreading and gathering
  # Separating and uniting
  # Missing values
  # Case study

## Answers to exercises can be found here: https://jrnold.github.io/r4ds-exercise-solutions/tidy-data.html#exercise-12.4.1

table1
table2
table3
table4a
table4b

table1 %>%
  mutate(rate = cases/population*10000) #mutate creates a new column (rate) with specified values (cases/population*10000)

table1 %>%
  count(year, wt = cases) #count returns a table with values for whichever variables listed (here, year) and a column headed "n" in which those values are placed (indicated by "wt"; here, values are number of cases of TB observed)

table1 %>%
  count(year, cases, country, wt = population) #you can keep building columns into the table by adding more variables to the argument

library(ggplot2)
ggplot(table1, aes(year, cases)) + 
  geom_line(aes(group = country), colour = "grey50") + 
  geom_point(aes(colour = country))

## Gathering

# gather into fewer columns
# makes wide tables narrower and longer
# use when some column names are values of a variable - see table 4a:

table4a

tidy4a = table4a %>%
  gather('1999', '2000', key = "year", value = "cases")

# first enter set of columns that represent values
# key is the name of the variable whose values form the column names (year)
# value is the name of the variable whose values are spread over the cells (cases)

table4b

tidy4b = table4b %>%
  gather('1999', '2000', key = "year", value = "population")

# to combine data tables, need to use left_join (will learn later)
left_join(tidy4a, tidy4b)

## Spreading

# spread into more columns
# makes long tables shorter and wider
# use when an observation is spread across multiple rows - see table 2:

table2

table2 %>%
  spread(key = "type", value = "count")

# practice: tidy the following table

preg <- tribble(
  ~pregnant, ~male, ~female,
  "yes",     NA,    10,
  "no",      20,    12
)

tidypreg = preg %>%
  gather('male', 'female', key = "sex", value = "count", na.rm = TRUE)

## Separate

# separates values from one column into multiple columns
# use when one column contains two variables - see table 3:

table3

table3 %>%
  separate(rate, into = c("cases", "population"))

# by default, will split values whenever it sees a non-alphanumeric character, but can use sep argument to specify the character

# separate will also leave type of columns as is after separating, so can ask separate to convert to better types using convert = TRUE
           
table3 %>%
  separate(rate, into = c("cases", "population"), sep = "/", convert = TRUE)

# can pass a vector of integers to sep, which will be interpreted as positions to split at. Positive values start at 1 on the far-left of strings; negative value start at -1 on the far-right of the strings. When using integers to separate strings, the length of sep should be oe less than the number of names in "into."

table3 %>%
  separate(year, into = c("century", "year"), sep = 2)

## Unite

# combines multiple columns into one column - see table 5 (just what we did to table 3 above, separating year into century and year columns)

table5

table5 %>%
  unite(new, century, year)

# by default, unite adds an underscore between century and year so we need to use sep argument

table5 %>%
  unite(new, century, year, sep = "")

## Missing Values

# two types of missing values: explicit (flagged w/NA) or implicit (simply not present)
# an explicit mising value is the presence of an absence; an implicit missing value is the absence of a presence

stocks <- tibble(
  year   = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
  qtr    = c(   1,    2,    3,    4,    2,    3,    4),
  return = c(1.88, 0.59, 0.35,   NA, 0.92, 0.17, 2.66)
)

# here, there is explicit missing data with the NA, and implicit missing data when there is no data for quarter 1 in 2016

# you can make the implicit values explicit by putting years in the columns:

stocks %>%
  spread(year, return)

# or you can set na.rm = TRUE in gather() to make explicit missing values implicit:

stocks %>%
  spread(year, return) %>%
  gather(year, return, '2015':'2016', na.rm = TRUE)

# complete is a useful tool for filling in missing values with explicit NAs because it finds all unique combinations of columns

stocks %>%
  complete(year, qtr)

# one other tool: when a data source has primarily been used for data entry, missing values indicate that the previous value should be carried forward:

treatment <- tribble(
  ~ person,           ~ treatment, ~response,
  "Derrick Whitmore", 1,           7,
  NA,                 2,           10,
  NA,                 3,           9,
  "Katherine Burke",  1,           4
)

# you can fill in these missing values with fill(), which takes a set of columns where you want missing values to be replaced by the most recent non-missing value/observation

treatment %>%
  fill(person)

## Case study

who # tuberculosis dataset

# first, gather together the columns that are not variables

# a bunch of columns are headed new_sp_m014, etc. We need to gather all these. We'll give the values the generic name "key" and the variable "cases". For now, use na.rm because there are a lot of missing values.

who1 <- who %>%
  gather(new_sp_m014:newrel_f65, key = "key", value = "cases", na.rm = TRUE)

who1

who1 %>%
  count(key)

# "new" means new TB cases
# "rel" stands for cases of relapse
# "ep" stands for cases of extrapulmonary TB
# sixth letter gives sex of TB patients
# numbers give the age group (ie 1524 is 15-24 year olds)

# we want to separate newrel into a string: new_rel

who2 <- who1 %>%
  mutate(key = stringr::str_replace(key, "newrel", "new_rel"))

who2

# separate into several columns

who3 <- who2 %>%
  separate(key, c("new", "type", "sexage"), sep = "_")

who3

# get rid of "new" column because there are only new cases, and get rid of iso2 and iso3 because they're redundant

who3 %>%
  count(new)

who4 <- who3 %>%
  select(-new, -iso2, -iso3)

# separate sexage into sex and age by splitting after the first character

who5 <- who4 %>%
  separate(sexage, c("sex", "age"), sep = 1)

who5

# Yay! It's tidy. Above showed all the pieces separately, but normally you would pipe them all together:

who %>%
  gather(key, value, new_sp_m014:newrel_f65, na.rm = TRUE) %>% 
  mutate(key = stringr::str_replace(key, "newrel", "new_rel")) %>%
  separate(key, c("new", "var", "sexage")) %>% 
  select(-new, -iso2, -iso3) %>% 
  separate(sexage, c("sex", "age"), sep = 1)




