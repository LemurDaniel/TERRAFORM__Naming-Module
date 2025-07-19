
locals {
  parent_path = abspath(format("%s/convention/%s/%s", path.module, var.convention, var.convention))

  file = {
    abbreviations = yamldecode(file(format("%s.abbreviations.yaml", local.parent_path)))
    locations     = yamldecode(file(format("%s.locations.yaml", local.parent_path)))

    settings = coalesce(var.default_naming, try(yamldecode(file(format("%s.naming.yaml", local.parent_path))), null)).settings
    patterns = coalesce(var.default_naming, try(yamldecode(file(format("%s.naming.yaml", local.parent_path))), null)).patterns
    mappings = coalesce(var.default_naming, try(yamldecode(file(format("%s.naming.yaml", local.parent_path))), null)).mappings
  }
}


output "locations" {
  description = "Output the locations part of the schema."
  value       = local.file.locations
}

output "resources" {
  description = "Output the resources part of the schema."
  value       = local.file.abbreviations
}

output "settings" {
  description = "Output the settings part of the schema."
  value       = local.file.settings
}

output "mappings" {
  description = "Output the mappings part of the schema."
  value       = local.file.mappings
}

output "patterns" {
  description = "Output the patterns part of the schema."
  value       = local.file.patterns
}

output "default_parameter" {
  description = "Output the default parameters for the schema."
  value = merge(
    {
      location = var.default_location
    },
    var.default_parameter
  )
}
