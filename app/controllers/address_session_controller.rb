class AddressSessionController < ApplicationController
  def create
    # 送られてきた住所情報の中に空の値がないかを判定(building以外)
    address_session_params.each do |key, value|
      if key != 'building'
        if value == ""
          redirect_to new_4_profiles_path
          return
        end
      end
    end

    session[:postal_code] = address_session_params[:postal_code]
    session[:prefecture] = address_session_params[:prefecture]
    session[:city] = address_session_params[:city]
    session[:block] = address_session_params[:block]
    session[:building] = address_session_params[:building]

    redirect_to controller: :profiles, action: :new_5
  end

  private

  def address_session_params
    params.permit(:postal_code, :prefecture, :city, :block, :building)
  end
end
