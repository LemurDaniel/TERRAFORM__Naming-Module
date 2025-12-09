

/*

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  The naming schema parameter used for the name generation.

*/
variable "schema" {
  nullable    = true
  description = "(Required) The schema to use for naming. If not set, the default schema is used."
  type = object({

    random = object({
      uuid = string
    })

    index_modifier     = number
    enforce_lower_case = any

    abbreviations = map(map(string))
    mappings      = map(map(string))
    patterns      = any

    default_parameters = map(any)
  })
}

/*

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Common or required variables for the naming module.
  - resource: The type to identify the abbreviation for the resource. e.g. "azurerm_resource_group", "azurerm_disk::os"
  - location: The location to use for naming. Some namings might not require this.
  - parameters: The parameters to use for naming. Use 'override' to override the naming
*/

variable "resource" {
  nullable    = false
  description = "(required) The resource to use for naming."
  type        = string
}

variable "location" {
  nullable    = true
  description = "(optional) The location to use for naming."
  type        = string
  default     = null
}

variable "parameters" {
  nullable    = false
  description = "(optional) The parameters to use for naming. Use 'override' to override the naming generation."
  type        = map(any)
  default     = {}
}


/*

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Special parameters for advanced functionality.
  - index: The range of the index to use for naming. Creates an array of resource names with different indices.
    - start: The starting index. Default is 0.
    - count: The number of indices to use. Default is 1.
  - naming_id: An optional identifier to uniquely identify in the schema.
*/

variable "index" {
  nullable    = false
  description = "(optional) The index to use for naming. If not set, the default index is used."
  type = object({
    start = optional(number, 0)
    count = optional(number, 1)
  })
  default = {
    start = 0
    count = 1
  }
}

variable "naming_id" {
  nullable    = true
  description = "(optional) An optional identifier to uniquely identify in the schema. If not set kind or default is used."
  type        = string
  default     = ""
}
