class Api::V1::ClientResource < JSONAPI::Resource
  attributes :region, :name, :is_active

  belongs_to :region
  has_many :raw_executives

  filters :name, :is_active
end
