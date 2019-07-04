class CreateSessionsController < ApplicationController
  def create_user_session
    session[:nickname] = user_session_params[:nickname]
    session[:email] = user_session_params[:email]
    session[:password] = user_session_params[:password]
    session[:password_confirmation] = user_session_params[:password_confirmation]

    session[:family_name] = profile_session_params[:family_name]
    session[:first_name] = profile_session_params[:first_name]
    session[:family_name_kana] = profile_session_params[:family_name_kana]
    session[:first_name_kana] = profile_session_params[:family_name_kana]

    redirect_to controller: 'profiles', action: 'new_3'
  end

  def session_address
    session[:postal_code] = address_session_params[:postal_code]
    session[:prefecture] = address_session_params[:prefecture]
    session[:city] = address_session_params[:city]
    session[:block] = address_session_params[:block]
    session[:building] = address_session_params[:building]

    redirect_to controller: :profiles, action: :new_5
  end

  private

  def user_session_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end

  def profile_session_params
    profile_param = params.require(:user)
    profile_param.require(:profile).permit(:family_name, :first_name, :family_name_kana, :first_name_kana)
  end

  def address_session_params
    params.permit(:postal_code, :prefecture, :city, :block, :building)
  end

end
