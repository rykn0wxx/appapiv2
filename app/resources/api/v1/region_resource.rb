class Api::V1::RegionResource < JSONAPI::Resource
  attributes :name, :code, :label, :is_active

  has_many :clients

  filters :name, :code, :label, :is_active
end
