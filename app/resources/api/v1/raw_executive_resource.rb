class Api::V1::RawExecutiveResource < JSONAPI::Resource
  attributes :month, :client, :revenue, :ebit, :fte, :ticket, :sla_scope, :sla_attain

  belongs_to :client

  filters :month, :client
end
