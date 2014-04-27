## I wrote a pair of functions that cache the inverse of a matrix.
## Below are two functions that are used to create a special object to create a matrix and cache's its inverse.

## The first function makeCacheMarix creates a special "matrix", which is really list containing a function to a.set the value of 
##the matrix b.get the value of the matrix c.set the value of the inverse d.get the value of the inverse.

makeCacheMatrix <- function(x = matrix()) {
 m      m<- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)

}


## The folowng function calculates the inverse of the special "matrix" returned by makeCacheMatrix above.
##It first checks to see if the inverse has already been calculated.If so, it gets the mean from the cache
##and skips the computation.Otherwise,it calculates the inverse of the data and sets the value of the inverse
##in the cache via the setinvolve function.

cacheSolve <- function(x, ...) {

         m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m

}
