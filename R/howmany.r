setMethod("howmany", signature(x="memuse"),
  function(x, nrow, ncol, out.type="full", representation="dense", ..., sparsity=0.05, type="double", intsize=4, unit.names="short")
  {
    # Manage input arguments
    out.type <- match.arg(arg=tolower(out.type), choices=c("full", "approximate"))
    representation <- match.arg(tolower(representation), c("dense", "sparse"))
    type <- match.arg(arg=tolower(type), choices=c("double", "integer"))
    
    bytes <- check_type(type=type, intsize=intsize)
    
    # Get the size
    size <- convert_to_bytes(x)@size
    
    if (!missing(nrow)){
      if (!is.int(nrow))
        stop("argument 'nrow' must be an integer")
      else if (!missing(ncol))
        stop("you should supply at most one of 'nrow' and 'ncol'.  Perhaps you meant to use howbig()?")
      else
        ncol <- floor(size/(nrow*bytes))
    }
    else if (!missing(ncol)){
      if (!is.int(ncol))
        stop("argument 'ncol' must be an integer")
      nrow <- floor(size/(ncol*bytes))
    }
    else
      nrow <- ncol <- floor(sqrt(size/bytes))
    
    # Return
    ret <- c(nrow, ncol)
    
    if (out.type == "approximate")
      ret <- approx.size(ret, unit.names=unit.names)
    
    return( ret )
  }
)

