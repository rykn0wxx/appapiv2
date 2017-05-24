JSONAPI.configure do |config|
  config.json_key_format = :camelized_key
  config.route_format = :camelized_route

  config.resource_key_type = :uuid

  config.allow_include = true
  config.allow_sort = true
  config.allow_filter = true

  config.raise_if_parameters_not_allowed = true

  config.default_paginator = :none

  config.top_level_meta_include_record_count = false
  config.top_level_meta_record_count_key = :record_count

  config.top_level_links_include_pagination = true

  config.default_page_size = 10
  config.maximum_page_size = 20

  config.exception_class_whitelist = []

  config.always_include_to_one_linkage_data = true

end
