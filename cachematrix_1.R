# This was my first attempt to solve Assignment 2 before searching for help. 
#We can identify multiple errors:

makeCacheMatrix <- function(x = numeric()) {    # Classifying makeCacheMatrix as a Numeric Vector, instead of a Matrix Vector
    matrix <- NULL
    set <- function(y) {
        x <- matrix(c(3, 1, 2, 1), nrow = 2, ncol = 2)  # Confusing test values with setting the value of the matrix.
        x <<- y
        matrix <- NULL 
    }
    get <- function() x 
    invert_matrix <- function(x) matrix <<- solve(x) %*% x      # Incorrectly calling solve(x) function 
    get_inverse <- function() matrix
    list(set = set, get = get, invert_matrix = invert_matrix, get_inverse = get_inverse)
}

# Logical & syntactical errors in constructing our makeCacheMatrix function make it 
# impossible to accurately solve for our matrix inverse and arrive at the correct answer. 

cacheSolve <- function(x, ...) {
    matrix <- x$get_inverse()
    if(!is.null(matrix)) {
            message("Getting cached data")
            return(matrix)
    }
    data <- x$get()
    matrix <- solve(data, ...) %*% x 
    x$invert_matrix(matrix)
    matrix
}
