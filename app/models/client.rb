# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  region_id  :integer
#  name       :string
#  is_active  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_clients_on_region_id  (region_id)
#

class Client < ApplicationRecord
  belongs_to :region
  has_many :raw_executives
end
