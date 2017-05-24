class Api::V1::BaseController < JSONAPI::ResourceController
  before_action :delay

  def delay
    # sleep(3)
  end
end
