## In this programm, there is two function that cache the inverse of a 
## matrix

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
      inv=NULL
      set <- function(y){
            x <<- y
            inv <<- NULL
      }
      get=function()x
      setinv<-function(solve) inv <<- solve
      getinv<-function() inv
      list(set=set,get=get,setinv=setinv,getinv=getinv)
}


## This function computes the inverse of the special "matrix" returned by
## makeCacheMatriz above. If the inverse has already been calculated (and
## the matrix has not changed), then the cachesolve should retrieve the 
## the inverse from the cache.

cacheSolve <- function(x, ...) {
      inv <- x$getinv()
      if(!is.null(inv)){
            message("getting cached data")
            return(inv)
      }
      data <- x$get()
      inv<- solve(data,...)
      x$serinv(inv)
      inv
      ## Return a matrix that is the inverse of 'x'
}
