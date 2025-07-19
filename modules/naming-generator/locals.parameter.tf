
locals {

  resource = {
    full     = var.resource
    provider = split("_", var.resource)[0]
    type     = split("::", split("_", var.resource)[1])[0]

    kind = strcontains(var.resource, "::") ? split("::", var.resource)[1] : "default"
  }


  /*
    This checks the schema.resources for the correct abbreviation for the resource.
    It processes the schema resources in the following order:
    - Match to <resourceType>::<id>
    - Match to <resourceType>::<kind>
    - Match to <resourceType>::default
    - Match to <resourceType>
  */

  resources_provider = lookup(var.schema.resources, local.resource.provider, {})
  abbreviation = coalesce([
    // Match to <resourceType>::<id>
    lookup(local.resources_provider, "${local.resource.type}::${var.naming_id}", null),
    // Match to <resourceType>::<kind>
    lookup(local.resources_provider, "${local.resource.type}::${local.resource.kind}", null),
    // Match to <resourceType>::default
    lookup(local.resources_provider, "${local.resource.type}::default", null),
    // Match to <resourceType>
    lookup(local.resources_provider, local.resource.type, null),
  ]...)

  /*
    Checks if lowercase enforcement is required for the resource.
    It processes the schema settings in the following order:
    - Match to <resourceType> - wildcards match allowed (e.g. azurerm*)
    - provider default - matches all resources of the provider
    - default - matches all resources  
  */

  lowercase_provider = lookup(var.schema.settings.enforceLowerCase, local.resource.provider, {})
  enforceLowerCase = coalesce(concat(
    [
      for resource, lowerCase in local.lowercase_provider :
      lowerCase if can(regex(replace(resource, "*", ".*"), local.resource.type))
    ],
    [
      lookup(local.lowercase_provider, "default", null),
      lookup(var.schema.settings.enforceLowerCase, "default", false)
    ]
  )...)


  /*
    This checks the schema.mappings for the correct abbreviation for the location.
    It processes the schema mappings in the following order:
    - Normalize the mapping keys to lowercase.
    - Iterate over all parameters and lookup the mapping for each parameter.
    - If a mapping is not found, the parameter is used as is.
  */

  custom_mappings = {
    for parameter, parameter_mappings in var.schema.mappings :
    lower(parameter) => {
      for key, value in parameter_mappings :
      lower(key) => value
    }
  }

  parameter_mappings = {
    for param_name, param_value in merge(var.schema.default_parameter, var.parameters) :
    param_name => coalesce(concat(
      [
        for mapping_name, mapping_value in lookup(local.custom_mappings, lower(param_name), {}) :
        mapping_value if lower(param_value) == lower(mapping_name)
      ],
      [
        # If no mapping is found, use the original parameter value.
        param_value
      ]
    )...)
  }

  /*
    Modifies the parameters for the naming schema.
    - Applies the index modifier from the schema settings.
    - Applies the shortname for the location.
    - Merges the default parameters with the provided parameters.
    - Converts all keys to lowercase.
  */

  index    = var.index.start + var.schema.settings.indexModifier
  location = coalesce(var.location, lookup(var.schema.default_parameter, "location", "global"))

  parameters_merge = merge(
    local.parameter_mappings,
    {
      abbreviation = local.abbreviation
      type         = local.abbreviation
      location     = var.schema.locations[local.location]
      index        = 0 // This is meaningless, but here to avoid errors.
    }
  )

  parameters = {
    for key, value in local.parameters_merge :
    lower(key) => value
  }

}
