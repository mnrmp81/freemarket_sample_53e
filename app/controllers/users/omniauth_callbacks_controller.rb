# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end
  
  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @user = User.find_oauth(request.env["omniauth.auth"])
    if @user.present?
      sign_in @user, event: :authentication
      redirect_to after_sign_in_path_for(resource)
    else
      auth = request.env["omniauth.auth"]
      user = {
        uid: auth.uid,
        provider: provider,
        nickname: auth.info.name,
        email: auth.info.email,
        password: Devise.friendly_token[0, 20]
      }
      session[:devise_omniauth_data] = user
      redirect_to new_profile_path
    end

    def failure
      redirect_to root_path and return
    end

    def after_sign_in_path_for(resource)
      root_path
    end
  end

  


  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
