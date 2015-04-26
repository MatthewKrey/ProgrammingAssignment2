# Write two functions
# (1) makeCacheMatrix: This function will create a special "matrix" object than can cache its inverse.
# (2) cacheSolve: This function will compute the inverse of the special "matrix" returned by our first makeCacheMatrix function.
# If the inverse has already been calculated (and the matrix has not changed), then cacheSolve will retrieve the inverse from the cache. 


# Our first makeCacheMatrix function creates a special "matrix", which is really a list containing a function to:


makeCacheMatrix <- function(x = matrix()) {
    matrix_inverse <- NULL
    set <- function(y) {                                            # (1) Set the values of the matrix.
        x <<- y 
        matrix_inverse <<- NULL
    }
    get <- function() x                                             # (2) Get the values of the matrix.
    set_inverse <- function(inverse) matrix_inverse <<- inverse     # (3) Set the values of the inverse matrix. 
    get_inverse <- function() matrix_inverse
    list(set = set, get = get, set_inverse = set_inverse, 
         get_inverse = get_inverse)                                 # (4) Get the values of the inverse matrix.
}


# Our cacheSolve function calculates the inverse of the special "matrix" created by our makeCacheMatrix function above.

cacheSolve <- function(x, ...) {
    matrix_inverse <- x$get_inverse()
                                                                    # First, check to see if the matrix inverse has already been calculated.
    if(!is.null(matrix_inverse)) {      
        message("Getting cached data.")
        return(matrix_inverse)                                      # If so, cacheSolve retrieves matrix_inverse from the cache and skips the computation.
    }
    data <- x$get()
    matrix_inverse <- solve(data)                                   # Otherwise, it calculates the matrix inverse
    x$set_inverse(matrix_inverse)                                   # And sets the value of the inverse matrix in the cache via our set_inverse() function.
    matrix_inverse
}