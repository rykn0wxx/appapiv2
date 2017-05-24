class Api::V1::RawExecutiveResource < JSONAPI::Resource
  attributes :month, :client_id, :revenue, :ebit, :fte, :ticket, :sla_scope, :sla_attain

  belongs_to :client

  filters :month, :client
end
