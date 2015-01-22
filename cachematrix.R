## Programming Assginment 2
## Show benefit of  using  the <<- operator


## Define set of functions for getting setting and calculating
## First two functions, set and get, refers to the input data vector or matrix
## Other two functios are solving the inverse of the data,using the <<- operator, or retruning the solution.
## Two obect are defined, x is the data to act on, and M is the solution, inverse of x to return.
makeCacheMatrix <- function(x = matrix()) {
      M <- NULL
      set <- function(y) {
            x <<- y
            M <<- NULL
      }
      get <- function() x
      setmatrix <- function(solve) M <<- solve
      getmatrix <- function () M
      list(set = set, get = get,
           setmatrix = setmatrix,
           getmatrix = getmatrix)
      
}


## Call functions that were defined at inside scope of upper function
## and check when it is truly calculating or just returning the existed solution.
## Run this function on function object of the above
## to demo data is stored at memory and is not recalculated
## at second call, e.g. Lexical scope.
cacheSolve <- function(x, ...) {
      ## Return a matrix that is the inverse of 'x'
      M <-  x$getmatrix()
      if(!is.null(M)){
            message("getting cached data")
            return(M)
      }
      #if code had reached that line, the inverse
      #had not been calculated yet
      mydata <- x$get()
      M <- solve(mydata, ...)
      x$setmatrix(M)
      M
}


##  Check the code
## source the two functions first
# x = rbind(c(1, 5), c(5, 1))
# x
# m = makeCacheMatrix(x)
# m
# m$get()
# 
# cacheSolve(m)  #first run
# cacheSolve(m)  #second run


