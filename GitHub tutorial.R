###### GitHub Tutorial #####

# tutorial from: happygitwithr.com

# check that R installation is current

R.version.string
# or, just "version"

# after updating R version, move packages to new version using the following instructions:
#https://stackoverflow.com/questions/13656699/update-r-using-rstudio

# update packages

update.packages(ask = FALSE, checkBuilt = TRUE)

# check everything worked well:

version
packageStatus()



