howbig <- function(nrow, ncol, representation="dense", unit=.UNIT, unit.prefix=.PREFIX, unit.names=.NAMES, ..., sparsity=0.05, type="double", intsize=4)
{
  type <- match.arg(tolower(type), c("double", "integer"))
  
  x <- internal.mu(size=1, unit="b", unit.prefix=unit.prefix, unit.names=unit.names)
  
  bytes <- check_type(type=type, intsize=intsize)
  
  x@size <- nrow*ncol*bytes # number of bytes used
  
  representation <- match.arg(tolower(representation), c("dense", "sparse"))
  
  if (representation == "sparse")
  {
    if (sparsity < 0 || sparsity > 1)
      stop("argument 'sparsity' should be between 0 and 1")
    else
      x <- sparsity * x
  }
  
  x <- swap.unit(x, unit)
  
  return( x )
}

