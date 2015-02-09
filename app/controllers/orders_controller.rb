class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def price
    @model.price
  end

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end
  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def new
  @order = Order.new
  respond_to do |format|
    format.html # new.html.erb
    format.xml { render :xml => @order }
    end
  end

  def create
    @order = Order.new

    respond_to do |format|
      if @order.save
        format.html { redirect_to(root_path, :notice =>
          "Thank you for your order.") }
        format.xml { render :xml => @order, :status => :created,
          :location => @order }
      else
        format.html {render :action => "show" }
        format.xml { render :xml => @order.errors,
          :status => unprocessable_entity}
      end
    end
  end


  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:address, :references, :pay_type)
    end
end
