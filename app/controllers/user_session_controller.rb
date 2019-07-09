class UserSessionController < ApplicationController
  def create
    session[:user] = user_session_params
    session[:profile] = profile_session_params

    # userとprofileのエラーメッセージを作成
    user = User.new(user_session_params)
    profile = user.build_profile(profile_session_params)
    user.valid?

    if user.errors.any?
      # エラーメッセージがあった場合、flashにエラーメッセージを格納。
      # view側でキーを指定してエラーメッセージを取り出せるようにハッシュに変換
      flash[:alert] = user.errors.keys.map { |key| [ key, user.errors.full_messages_for(key) ] }.to_h
      redirect_to new_profile_path
    else
      redirect_to controller: 'users', action: 'sms_confirmation'
    end
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
