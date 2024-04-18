##===============================================================
## Explorator factor analysis in R: example code
##===============================================================

# Install and load packages needed
install.packages('psych')
install.packages('GPArotation')
library(psych)
library(GPArotation)

# Read in the data here 
# data = 


# How to chose the number of factors: 

# We'll be using `Psych` package's `fa.parallel` function to execute parallel 
# analysis. 
# Here we specify the data frame and factor method (`minres` in our case). 
# Run the following to find acceptable number of factors and generate the `scree plot`:
parallel <- fa.parallel(data, fm = 'minres', fa = 'fa')


# When you have chosen the number of factors, you can perform a FA with this 
# fixed number of factors. To do so, using the psych package, you have to supply:
# r  - Raw data or correlation or covariance matrix
# nfactors - Number of factors to extract
# fm - the factor extraction technique used (in the workshop, we only discussed 
# "principal axis factoring",  but you can also for example maximum likelihood
# estimates)

# Example: Run an EFA with a fixed number of 3 factors, without rotation
threefactor <- fa(data, nfactors = 3, rotate = "oblimin", fm="pa")

# Rotation: 
# For rotation, use the extra option "rotate" with "Varimax" or "Oblimin"
# Example: Run an EFA with a fixed number of 3 factors, with Oblimin rotation
threefactor <- fa(data, nfactors = 3, rotate = "oblimin", fm = "pa")


# To improve visibility and get to an easier interpretation, we can make use of
# the rules for a simple structure and only show loadings >= 0.3  
print(threefactor$loadings,cutoff = 0.3)
