class SessionsController < ApplicationController

  def session_address
    session[:prefecture] = params[:prefecture]
    session[:city] = params[:city]
    session[:block] = params[:block]
    session[:building] = params[:building]

    redirect_to controller: :profiles, action: :new_5
  end


end
