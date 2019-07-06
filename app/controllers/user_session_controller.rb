class UserSessionController < ApplicationController
  def create
    # 送られてきたユーザー情報の中に空の値がないか判定
    user_session_params.each do |key, value|
      if value == ""
        redirect_to new_profile_path
        return
      end
    end

    # 送られてきたプロフィール情報の中に空の値がないかを判定
    profile_session_params.each do |key, value|
      if value == ""
        redirect_to new_profile_path
        return
      end
    end

    # パスワードが英数字6文字以上かどうかを判定
    unless user_session_params[:password].match(/[a-zA-Z0-9]{6,}/)
      redirect_to new_profile_path
      return
    end

    # passwordとpassword_confirmationが一致しているかどうかを判定
    if user_session_params[:password] != user_session_params[:password_confirmation]
      redirect_to new_profile_path
      return
    end

    session[:nickname] = user_session_params[:nickname]
    session[:email] = user_session_params[:email]
    session[:password] = user_session_params[:password]
    session[:password_confirmation] = user_session_params[:password_confirmation]

    session[:family_name] = profile_session_params[:family_name]
    session[:first_name] = profile_session_params[:first_name]
    session[:family_name_kana] = profile_session_params[:family_name_kana]
    session[:first_name_kana] = profile_session_params[:family_name_kana]

    redirect_to controller: 'users', action: 'sms_confirmation'
  end

  private

  def user_session_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end

  def profile_session_params
    profile_param = params.require(:user)
    profile_param.permit(:family_name, :first_name, :family_name_kana, :first_name_kana)
  end

end
