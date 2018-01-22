
## makeCacheMatrix creates an object that will cache the inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }

  get <- function ()x
  
  setInv <- function(inverse) inv <<- inverse
  getInv <- function()inv
  list( set = set, get = get, setInv = setInv, getInv = getInv)
  
}


## cacheSolve takes the output from makeCacheMatrix and solves the inverse,
## if the theres no change in the number, will use inverse from cache


cacheSolve <- function(x, ...) {
  inv <- x$getInv()
  if(!is.null(inv))  {
    message("getting cached data")
    return(inv)
  }
data <- x$get()
inv <- solve(data, ...)
x$setInv(inv)
inv  
  
  
}
