

/*

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Common or required variables for the resource group module.
  - location: The common location for resource deployment.
  - tags: The common tags used for resource deployment.
  - naming: The parameters to use for naming. Use 'override' to override the naming generation.
  - naming_schema: The schema to use for naming. From the naming-schema module.
*/

variable "location" {
  nullable    = false
  description = "(Required) The common location for resource deployment."
  type        = string
}

variable "tags" {
  nullable    = false
  description = "(Required) The common tags used for resource deployment."
  type        = map(string)
}

variable "naming" {
  nullable    = false
  description = "(required) The parameters to use for naming. Use 'override' to override the naming generation."
  type        = map(any)
}


variable "naming_schema" {
  nullable    = true
  description = "(optional) The schema to use for naming."
  type = object({
    locations = map(string)
    resources = map(map(string))

    settings = object({
      indexModifier = optional(number, 1)

      enforceLowerCase = optional(any, {
        default = true
      })

      mappings = optional(map(map(string)), {})
    })

    default_parameter = map(any)
    patterns          = any
  })
  default = null
}
