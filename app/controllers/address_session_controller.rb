class AddressSessionController < ApplicationController
  def create
    session[:address] = address_session_params
    
    # addressのエラーメッセージを作成
    address = Address.new(address_session_params)
    address.valid?

    # addressのエラーメッセージからkeyが:userの物を削除
    address.errors.messages.delete(:user)

    if address.errors.any?
      # エラーメッセージがあった場合、flashにエラーメッセージを格納
      # view側でキーを指定してエラーメッセージを取り出せるようにハッシュに変換
      flash[:alert] = address.errors.keys.map { |key| [ key, address.errors.full_messages_for(key) ] }.to_h
      redirect_to new_address_path
    else
      redirect_to controller: :credit_card, action: :new
    end

  end

  private

  def address_session_params
    params.permit(:postal_code, :prefecture_id, :city, :block, :building)
  end
end
