class AddressController < ApplicationController
  before_action :set_address, only: %i[destroy update]

  def index
    addresses = Address.where(user_id: @current_user.id)
    render json: {addresses:addresses, status: :ok}
  end

  def create
    address = Address.new(address_params)
    address.user_id = @current_user.id
    if address.save
      render json: {message: 'Your address is added', status: :ok}
    else
      render json: {error:address.errors.messages, status: :unprocessable_entity}
    end
  end

  def update
    if @address.user_id == @current_user.id
      @address.update(address_params)
      render json: { message: 'Your address is updated', status: :ok}
    else
      render json: { error:address.errors.messages, status: :unprocessable_entity }
    end
  end

  def destroy
    if @address.user_id == @current_user.id
      @address.destroy
      render json: { message: 'Your address is destroyed', status: :ok}
    else
      render json: { error:address.errors.messages, status: :unprocessable_entity }
    end
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit!
  end
  
end
