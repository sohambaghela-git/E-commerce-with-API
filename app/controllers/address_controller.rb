class AddressController < ApplicationController

  def create
    address = Address.new(address_params)
    address.user_id = @current_user.id

    if address.save
      render json: {message: 'Your address is Added', status: :ok}
    else
      render json: {message: 'You can not Add  address', status: :unprocessable_entity}
    end
  end

  private 

  def address_params
    params.require(:address).permit!
  end
  
end
