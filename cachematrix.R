## This is a test 
## Create two functions that are used to create a special object that stores a matrix and cache's the inverse of the matrix.

## makeCacheMatrix is a function that storesa list of functions, including set, get,setinverse and get inverse
## x is a matrix that needed to be inversed
## i is to save the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## cacheSolve function does two things. If the inverse is already calculated, the function will retrieve the inverse from the cache. Otherwise, it will calucate the inverse.

cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i
        ## Return a matrix that is the inverse of 'x'
}
