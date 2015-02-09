class ListingsController < ApplicationController


before_action :logged_in_user, only: [:create, :destroy, :buy]


def create
  @model = current_user.listings.build(listing_params)
  if @model.save
    flash[:success] = "Listing created!"
    redirect_to root_url
  else
    render 'static_pages/home'
  end
end

def show
  @model = Listing.find(params[:id])
  respond_to do |format|
    format.html
    format.json { render :json => @models }
  end
end

def edit
  @model = Listing.find(params[:id])
end


def index
  @models = Listing.paginate(page: params[:page])
  respond_to do |format|
    format.html
    format.json { render :json => @models }
  end
end

def update
  if @model.update(listing_params)
    redirect_to @model, notice: 'listing was successfully updated'
  else
    render :edit
  end
end

def destroy
  @model = Listing.find(params[:id])
  @model.destroy
  redirect_to root_path, notice: 'Listing was successfully deleted.'
end

def new
  @model = Listing.new
end
private

def find_model
  @model = Listing.find(params[:id])
end

def listing_params
  params.require(:listing).permit(:title, :description, :price)
end

end
