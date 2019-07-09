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
end
