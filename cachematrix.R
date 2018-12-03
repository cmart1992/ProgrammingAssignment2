## Put comments here that give an overall description of what your

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setinverse <- function(inv) inverse <<- inv
  getinverse <- function() inverse
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}

## Inverse of the matrix

cacheSolve <- function(x, ...) {
  inverse <- x$getinv()
  if(!is.null(inverse)) {
    message("BRB Getting Cached Results")
    return(inv)
  }
  data <- x$get()
  inverse <- solve(data, ...)
  x$setinv(inv)
  inverse
}	

#Testing 
BORING <- matrix(rnorm(32),4,4)
MEH <- makeCacheMatrix(BORING)
cacheSolve(MEH)
