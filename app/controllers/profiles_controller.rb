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
    @user = User.find(params[:id]) 
  end

  def update
  end

  def profile_update
    binding.pry
    User.update(user_update_params)
    Profile.update(profile_update_params)
  end

  private
  
  def user_update_params
    params.permit(:avatar, :nickname)
  end

  def profile_update_params
    params.permit(:profile)
  end

end
