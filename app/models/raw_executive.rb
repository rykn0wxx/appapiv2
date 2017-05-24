# == Schema Information
#
# Table name: raw_executives
#
#  id         :integer          not null, primary key
#  month      :datetime
#  client_id  :integer
#  revenue    :float
#  ebit       :float
#  fte        :float
#  ticket     :float
#  sla_scope  :float
#  sla_attain :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_raw_executives_on_client_id  (client_id)
#

class RawExecutive < ApplicationRecord
  belongs_to :client
end
