
locals {

  /*
    This checks the schema.patterns for a matching pattern for the resource.
    It processes the schema patterns in the following order:
    - Match to <resourceType>.<id>
    - Match to <resourceType>.<kind>
    - Match to <resourceType>.default
    - Match to default
    - Fail with an error, if no pattern is found
  */

  patterns_provider = lookup(var.schema.patterns, local.resource.provider, {})

  pattern_selected = coalesce([
    // Match to <resourceType>.<id>
    lookup(lookup(local.patterns_provider, local.resource.type, {}), var.naming_id, null),
    // Match to <resourceType>.<kind> OR <resourceType>.default
    lookup(lookup(local.patterns_provider, local.resource.type, {}), local.resource.kind, null),
    // Match to default
    lookup(local.patterns_provider, "default", null),
  ]...)



  /*
    This splits the selected pattern into components.

    For each component, metadata is added:
    - value: The value of the component, without any angle brackets.
    - format: The format string, if specified, otherwise defaults to "%s".
    - isRequired: A boolean indicating if the component is required (not optional).
    - isParameter: A boolean indicating if the component is a parameter (enclosed in angle brackets).  
  */

  pattern_compacted = compact(split("~&", replace(replace(local.pattern_selected, "<", "~&<"), ">", ">~&")))

  pattern = [
    for component in local.pattern_compacted :
    {
      raw   = component
      value = split(";", replace(replace(component, "<", ""), ">", ""))[0]


      isRequired  = !strcontains(component, "?")
      isParameter = strcontains(component, "<") && strcontains(component, ">")
      isIndex     = strcontains(lower(component), "index") && strcontains(component, ">") && strcontains(component, "<")

      paramName = lower(split(";", replace(replace(component, "<", ""), ">", ""))[0])

      format = strcontains(component, ";") ? replace(split(";", component)[1], ">", "") : "%s"
    }
  ]
}
