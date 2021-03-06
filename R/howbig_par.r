howbig.par <- function(nrow, ncol, cores=1, par="balanced", unit=.UNIT, unit.prefix=.PREFIX, unit.names=.NAMES, ..., type="double", intsize=4, ICTXT=0, bldim=c(4, 4))
{
  par <- match.arg(arg=tolower(par), choices=c("dmat", "balanced"))
  
  x <- howbig(nrow=nrow, ncol=ncol, unit=unit, unit.prefix=unit.prefix, unit.names=unit.names, type=type, intsize=intsize)
  
  # local
  if (par == "balanced") {
    y <- convert_to_bytes(x)
  
    y@size <- y@size / cores
    y <- swap.unit(y, unit)
    
    out <- list(total=x, local=y)
  }
  else if (par == "dmat") {
    ldim <- numroc(nprocs=cores, dim=c(nrow, ncol), bldim=bldim, ICTXT=ICTXT)
    
    z <- howbig(nrow=ldim[1L], ncol=ldim[2L], unit=unit, unit.prefix=unit.prefix, unit.names=unit.names, type=type, intsize=intsize)
    
    out <- list(total=x, local=z)
  } 
  
  return( out )
}

