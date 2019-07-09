class MypagesController < ApplicationController
  before_action :get_user_params, only: [:index, :identification]

  def index
  end

  def logout
  end

  def identification
    @profile = Profile.where(user_id: current_user.id).first
    @address = Address.where(user_id: current_user.id).first
  end


  def edit
  end

  def get_user_params
    @user = User.find(params[:id])
  end

end
