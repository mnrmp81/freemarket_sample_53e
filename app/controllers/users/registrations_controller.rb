# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    # super
    credit_card_params.each do |key, value|
      if value == ""
        redirect_to '/profiles/new_5'
        return
      end
    end

    user = User.new(nickname: session[:nickname], email: session[:email], password: session[:password], password_confirmation: session[:password_confirmation])
    if user.save
      profile = user.build_profile(family_name: session[:family_name], first_name: session[:first_name], family_name_kana: session[:family_name_kana], first_name_kana: session[:first_name_kana])
      profile.save
      address = user.build_address(postal_code: session[:postal_code], prefecture: session[:prefecture], city: session[:city], block: session[:block], building: session[:building])
      address.save
      card = user.credit_cards.build(credit_card_params)
      card.save
      redirect_to '/profiles/new_6'
    else
      redirect_to '/users/sign_up'
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected
  # private

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  def credit_card_params
    card_param = params[:credit_card]
    date = card_param["expiration_date(2i)"] + card_param["expiration_date(3i)"]
    year = card_param["expiration_date(1i)"]
    params.require(:credit_card).permit(:card_number, :security_code).merge(expiration_date: date, expiration_year: year)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

end
