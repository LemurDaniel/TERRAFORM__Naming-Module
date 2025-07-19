

/*

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Common or required variables for the resource group module.
  - convention: The naming convention to use.
  - default_naming: Override the default.naming.yaml file.
  - default_parameter: The default parameters to use for the schema.
    - These are used when no specific parameters are provided.
    - For example project_name, environment, etc. as default parameters.
    - Then those needed be set on every naming module call anymore.
  - default_location: Special variant of default_parameters only for the location.
    - If not set, 'global' is used as default.
*/

variable "convention" {
  nullable    = false
  description = "(Required) The naming convention to use."
  type        = string
  default     = "default"

  validation {
    condition     = contains(["default", "other"], var.convention)
    error_message = "The naming convention '${var.convention}' was not found!"
  }
}

variable "default_naming" {
  nullable    = true
  description = "(Optional) The default patterns to use for the schema."
  type = object({
    mappings = optional(map(map(string)), {})
    settings = object({
      indexModifier = optional(number, 1)

      enforceLowerCase = optional(any, {
        default = true
      })
    })

    patterns = any
  })
  default = null
}

variable "default_parameter" {
  nullable    = false
  description = "(Required) The default parameters to use for the schema."
  type        = map(any)
  default     = {}
}

variable "default_location" {
  nullable    = false
  description = "(Optional) The default location to use for naming. If not set, 'global' is used."
  type        = string
  default     = "global"
}
