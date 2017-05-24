class Api::V1::RawExecutivesController < JSONAPI::ResourceController
  before_action :flat_raw

  def flat_raw
    zraw = RawExecutive.joins(client: :region)
    zraw = zraw.select('raw_executives.*, clients.name as client_name, regions.name as region_name, regions.label as region_label')
    render json: zraw
  end

end
