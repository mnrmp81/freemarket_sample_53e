class MypagesController < ApplicationController
  before_action :get_user_has_posts, only: [:purchase, :purchased, :listing, :in_transaction, :completed_transaction]
  before_action :get_user_purchase_products, only: [:purchase, :purchased]
  before_action :get_user_params, only: [:index, :identification]
  
  def index
  end

  def profile
  end

  def deliver_address
  end

  def logout
  end

  def identification
    @profile = Profile.where(user_id: current_user.id).first
    @address = Address.where(user_id: current_user.id).first
  end

  def edit
  
  end 

  def telephone_number
  end

  def email_password
    @user = User.find(current_user.id)
  end

  def purchase
  end

  def purchased
  end

  def listing
  end

  def in_transaction
  end

  def completed_transaction
  end




  private
  def get_user_has_posts
    @posts = current_user.posts
  end

  def get_user_purchase_products
    @products = current_user.orders
  end

  def get_user_params
    @user = User.find(params[:id])
  end

end
