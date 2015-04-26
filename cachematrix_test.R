## 
## Test basic caching. Test code courtesy of Karl Schultz, COMMUNITY TA.
##
n <- 5
mat <- matrix(rnorm(1:(n*n)), nrow=n, ncol=n)
matCached <- makeCacheMatrix(mat)
matSolved1 <- cacheSolve(matCached)
matSolved2 <- cacheSolve(matCached)
if (!identical(matSolved1, matSolved2))
    message("Cached version does not match solved version")

## Use a time test to see if we really save time.
## Experiment with different values of n to test how computation time we save. 

n <- 5000
mat <- matrix(rnorm(1:(n*n)), nrow=n, ncol=n)
matCached <- makeCacheMatrix(mat)
time1 <- system.time(matSolved1 <- cacheSolve(matCached))
time2 <- system.time(matSolved2 <- cacheSolve(matCached))
if (time1["user.self"] < time2["user.self"])
    message("Solve time is less than cache time")
