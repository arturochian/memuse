### Constructor methods
setMethod("mu", signature(size="NULL"),
  function(size=0, unit=.UNIT, unit.prefix=.PREFIX, unit.names=.NAMES)
  {
    return( NULL )
  }
)



setMethod("mu", signature(size="numeric"),
  function(size=0, unit=.UNIT, unit.prefix=.PREFIX, unit.names=.NAMES)
  {
    return( internal.mu(size=size, unit=unit, unit.prefix=unit.prefix, unit.names=unit.names) )
  }
)



setMethod("mu", signature(size="object_size"),
  function(size, unit=.UNIT, unit.prefix=.PREFIX, unit.names=.NAMES)
  {
    return( internal.mu(size=unclass(size), unit=unit, unit.prefix=unit.prefix, unit.names=unit.names) )
  }
)



setMethod("mu", signature(size="missing"),
  function(size=0, unit=.UNIT, unit.prefix=.PREFIX, unit.names=.NAMES)
  {
    return( memuse(0, unit=unit, unit.prefix=unit.prefix, unit.names=unit.names) )
  }
)




setMethod("memuse", signature(size="NULL"),
  function(size=0, unit=.UNIT, unit.prefix=.PREFIX, unit.names=.NAMES)
  {
    return( NULL )
  }
)



setMethod("memuse", signature(size="missing"),
  function(size=0, unit=.UNIT, unit.prefix=.PREFIX, unit.names=.NAMES)
  {
    return( mu(0, unit=unit, unit.prefix=unit.prefix, unit.names=unit.names) )
  }
)




setMethod("memuse", signature(size="numeric"),
  function(size=0, unit=.UNIT, unit.prefix=.PREFIX, unit.names=.NAMES)
  {
    return( internal.mu(size=size, unit=unit, unit.prefix=unit.prefix, unit.names=unit.names) )
  }
)



setMethod("memuse", signature(size="object_size"),
  function(size, unit=.UNIT, unit.prefix=.PREFIX, unit.names=.NAMES)
  {
    return( internal.mu(size=unclass(size), unit=unit, unit.prefix=unit.prefix, unit.names=unit.names) )
  }
)



setMethod("object.size", signature(x="ANY"),
  function(x)
  {
    return( mu(utils::object.size(x)) )
  }
)

