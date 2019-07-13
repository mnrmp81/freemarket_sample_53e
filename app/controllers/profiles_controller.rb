class ProfilesController < ApplicationController
  def new
    @minimum_password_length = 6
    
    if session[:devise_omniauth_data].present?
      @user = User.new(
        uid: session[:devise_omniauth_data]["uid"],
        provider: session[:devise_omniauth_data]["provider"],
        nickname: session[:devise_omniauth_data]["nickname"],
        email: session[:devise_omniauth_data]["email"],
        password: session[:devise_omniauth_data]["password"]
      )
    else
      if session[:user]
        @user = User.new(email: session[:user]["email"], nickname: session[:user]["nickname"])
      else
        @user = User.new
      end
    end
    if session[:profile]
      @profile = Profile.new(session[:profile])
    else
      @profile = Profile.new
    end
    # セッションを削除
    session[:user] = nil
    session[:profile] = nil
    session[:devise_omniauth_data] = nil
  end

  def edit_address_delivery
    @user = User.find_by(params[:id])
    @profile = Profile.find_by(user_id: params[:id])
    @address = Address.find_by(user_id: params[:id])
  end

  def update_address_delivery
    @user = User.find_by(id: current_user) 
    profile = Profile.find_by(user_id: current_user)
    address = Address.find_by(user_id: current_user)
    if profile.update(profile_delivery_params) && address.update(address_delivery_params)
      redirect_to controller: :mypages, action: :index
    else
      redirect_to controller: :mypages, action: :profile
    end

  end

  def profile_update
    if User.update(user_update_params) && Profile.update(profile_update_params)
       redirect_to mypage_path
    else
      redirect_to profile_mypage_path
    end
  end
    
  private

  def profile_delivery_params
    params.permit(:family_name,:first_name,:family_name_kana,:first_name_kana)
  end

  def address_delivery_params
    params.permit(:postal_code,:prefecture_id,:city,:block,:building)
  end
  
  def user_update_params
    params.permit(:avatar, :nickname)
  end

  def profile_update_params
    params.permit(:profile)
  end

end
