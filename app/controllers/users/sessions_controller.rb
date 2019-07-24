# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    
    # メールアドレス、パスワードが入力されなかった場合のエラーメッセージ
    flash[:blank] = blank_error_message(login_params)
    
    if Rails.env == "production"
      if verify_recaptcha.blank?
        redirect_to action: "new"
      else
        super
        flash[:notice] = nil
      end
    else
      super
      flash[:notice] = nil
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def login_params
    params.require(:user).permit(:email, :password)
  end

  def blank_error_message(login_params)
    error_messages = []
    login_params.each do |key, value|
      if value.blank?
        error_messages << [key, '入力してください']
      end
    end
    return error_messages.to_h
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end


end
