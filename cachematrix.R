## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

##makeCacheMatrix function returns a list of functions to access original matrix
##as well as its inverse

makeCacheMatrix <- function(x = matrix()) {
	i <- NULL
	
	set <- function(y) {
		x <<- y
		i <<- NULL
	}

	setinverse <- function(inv) i <<- inv
	
	get <- function() x
	
	getinverse <- function() i

	list(set = set, setinverse = setinverse, get = get, getinverse = getinverse)
}

## Write a short comment describing this function

##cacheSolve function first checks to see if inverse matrix already calculated and returns
##it if found, else it calls solve function to calculate new inverse matrix, if original
matrix changed

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

	i <- x$getinverse()

	if (!is.null(i)) {
		message("retrieving cached inverse matrix")
		return(i)
	}

	##get matrix
	m <- x$get()
	
	inv <- solve(m)
	x$setinverse(inv)
	inv	
}
