locals {

  name_generated = [
    for component in local.pattern :
    {
      isIndex = component.isIndex
      format  = component.format
      value = coalesce([
        // When NOT Parameter, return the value itself
        !component.isParameter ? component.value : null,

        // When Parameter, return the parameter value
        component.isParameter ? lookup(local.parameters, component.paramName, null) : null,

        // When Parameter and required, return the parameter value
        component.isParameter && component.isRequired ? local.parameters[component.paramName] : null,
      ]...)
    }
  ]

  name_formatted = [
    for num in range(var.index.start, var.index.count) :
    [
      for component in local.name_generated :
      // Makes the index adjustment if the component is an index
      // else applies the correct formatting
      component.isIndex ? format(component.format, num + local.index) : format(component.format, component.value)
    ]
  ]

  name_final = [
    for name in local.name_formatted :
    local.enforceLowerCase ? lower(join("", compact(name))) : join("", compact(name))
  ]

}
