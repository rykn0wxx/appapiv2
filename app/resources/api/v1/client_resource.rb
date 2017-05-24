class Api::V1::ClientResource < JSONAPI::Resource
  attributes :region, :name, :is_active

  belongs_to :region

  filters :name, :is_active
end
