## A function to create a matrix and another function to cache the inverse of that matrix

## The following function is to set and get a new matrix and inverse matrix
## the inverse matrix may or may not the inverse of the actual matrix 
makeCacheMatrix<-function(x=matrix()){
	inv<-NULL
	set<-function(y){
		x<<-y
		inv<<-NULL
	}
	get<-function() x
	setinv<-function(solve) inv<<-solve
	getinv<-function() inv
	list(set=set,get=get,setinv=setinv,getinv=getinv)
}

## The following function is to cache the inverse of matrix created above 
## if the inverse matrix is not set then it calculates the inverse of actual matrix
cacheSolve<-function(x,...){
	inv<-x$getinv()
	if(!is.null(inv)){
		message("getting cached data")
		return(inv)
	}
	data<-x$get()
	inv<-solve(data,...)
	x$setinv(inv)
	inv
}
