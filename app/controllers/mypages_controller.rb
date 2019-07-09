class MypagesController < ApplicationController
  before_action :get_user_has_posts, only: [:purchase, :purchased, :listing, :in_transaction, :completed_transaction]
  before_action :get_user_purchase_products, only: [:purchase, :purchased]

  def index
  end

  def logout
  end

  def identification
  end

  def edit
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

end
