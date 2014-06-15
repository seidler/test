
makeVector <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setreverse <- function(reverse) m <<- reverse
        getreverse <- function() m
        list(set = set, get = get,
             setreverse = setreverse,
             getreverse = getreverse)
}



cachereverse <- function(x, ...) {
        m <- x$getreverse()
        if( ! is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setreverse(m)
        m
}

