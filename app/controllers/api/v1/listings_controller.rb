class Api::V1::ListingsController < Api::V1::BaseController
  def index
    data = Listing.all.to_a.to_json
    render json: data
  end

  def show
    render json: Listing.find(params[:id])
  end

end
