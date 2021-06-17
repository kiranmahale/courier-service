class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.includes(:sender, :recipient).all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @sender = User.new
    @recipient = User.new
  end

  # GET /orders/1/edit
  def edit
    @sender = @order.sender
    @recipient = @order.recipient
  end

  # POST /orders or /orders.json
  def create
     status = create_order

    respond_to do |format|
      if status
        format.html { redirect_to orders_path, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
        format.js { render :js => "window.location = '#{orders_path}'" }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
        format.js { }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      status = update_order
      if status
        format.html { redirect_to orders_path, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
        format.js { render :js => "window.location = '#{orders_path}'" }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
        format.js { }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def create_order
      ActiveRecord::Base.transaction do
        @sender = Sender.create(sender_params)
        @recipient = Recipient.create(recipient_params)
        @order = Order.new(order_params)
        @order.sender = @sender
        @order.recipient = @recipient
        @order.save 
        @order.errors.blank? && @recipient.errors.blank? && @sender.errors.blank?
      end
    end

    def update_order
      ActiveRecord::Base.transaction do
        @order = Order.find(params[:id])
        @sender = @order.sender.update(sender_params)
        @recipient = @order.recipient.update(recipient_params)
        @sender = @order.sender
        @recipient = @order.recipient
        @order.update(order_params)
        @order.errors.blank? && @recipient.errors.blank? && @sender.errors.blank?
      end
    end
    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:weight, :service_type, :cost, :payment_mode, :status, :parcel_number)
    end

    def sender_params
      params.require(:order).require(:sender).permit(:id, :full_name, :pincode, :address, :email, :mobile)
    end

    def recipient_params
      params.require(:order).require(:recipient).permit(:id, :full_name, :pincode, :address, :email, :mobile)
    end
end
