class AddressController < ApplicationController
  def new
    if session[:address]
      @address = Address.new(session[:address])
    else
      @address = Address.new
    end

    # セッションを削除
    session[:address] = nil
  end

  def update
    address= Address.find(params[:id])

    if address.update(address_params)
      redirect_to controller: :mypages, action: :index
    else
      redirect_to controller: :address, action: :identification
    end
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :prefecture_id, :city, :block, :building)
  end
end
