## Matrix inversion is usually a costly computation and there may be some benefit
## to caching the inverse of a matrix rather than compute it repeatedly. The
## following two functions are used to cache the inverse of a matrix.

## makeCacheMatrix creates a list containing a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of inverse of the matrix
## 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {

	inverse<<-NULL

	setMatrix<- function(y)
	{	
		x<<-y
	}

	getMatrix<- function()
	{
		x
	}	

	setInverse<-function(z)
	{	
		inverse<<-z
	}

	getInverse<-function()
	{
		inverse
	}

	list(setmatrix=setMatrix,getmatrix=getMatrix,setinverse=setInverse,getinverse=getInverse)
}


## The following function returns the inverse of the matrix. It first checks if
##  the inverse has not been computed. If so, compute the inverse and if it has already 
##  has been computed get the result.

cacheSolve <- function(x, ...) {
       inverse<- x$getinverse()
	if(is.null(inverse))
	{
		message ("No cache")
		matrix<-x$getmatrix()
		inverse<-solve(matrix)
		x$setinverse(matrix)
		inverse
	}
	else
	{
		message("Getting from cache")
		inverse
	}
}

## Sample run
## m<- matrix(1:4,2,2)
## mat=makeCacheMatrix(m)
## cacheSolve(mat)
## No cache
##         [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
## cacheSolve(mat)
## Getting from cache
##        [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
