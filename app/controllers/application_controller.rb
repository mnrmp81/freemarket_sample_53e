class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
  end


  private

  # def production?
  #   Rails.env.production?
  # end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'yamucha' && password == '2222'
    end
  end
end
