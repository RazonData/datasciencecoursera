## The functions below are calculating the inverse matrix of a matrix. 
## Bevore the calculating is started it 'looks', if there already is a calculating inverse matrix.
## If there already is a stored result it is taken out of the cache. If not the inverse matrix is calculated.


## The function makeCacheMatrix creates a amtrix and a list of 4 functions to:
##  1. set the value of a matrix
##  2. get the value of a matrix
##  3. set the value of the inverse matrix
##  4. get the value of the inverse matrix


makeCacheMatrix <- function(x = matrix()) {
  m <- NULL                                  
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() 
    return(x)
  setmatrix <- function(invert) m <<- invert
  getmatrix <- function() 
    return(m)
  list(set = set, get = get,
       setmatrix = setmatrix,
       getmatrix = getmatrix)
}

## The functions cacheSolve calculates the inverse of the matrix created with the function makeCacheMatrix.
## Bevore calculating the inverse it looks, if the inverse of the matrix was calculated before.
## If this is the case, it takes the cached result and returns it, if not it calculates the inverse 
## returns it and sets the value of it using the setmarix function.

cacheSolve <- function(x = matrix(), ...) {
  m <- x$getmatrix()
  if(!is.null(m)){
    message("out of the cache")
    return(m)
  }
  matrix <- x$get()
  m <- solve(matrix, ...)
  x$setmatrix(m)
  return(m)
}
