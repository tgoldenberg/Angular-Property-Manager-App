class Api::V1::UsersController < Api::V1::BaseController
  def index
    data = User.all.to_a.to_json
    render json: data
  end

  def show
    render json: User.find(params[:id])
  end

end
