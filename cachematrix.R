## The two functions together compute the inverse of a matrix


## makeCacheMatrix function consists of four functions which can be called from cacheSolve function

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## cacheSolve matrix checks if inv is null or not and returns the inverse of a matrix

cacheSolve <- function(x, ...) {
     
          inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data.")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinverse(inv)
  inv
}
mat=matrix(1:4,2,2)
cacheSolve(makeCacheMatrix(mat))
