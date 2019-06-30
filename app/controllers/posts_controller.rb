class PostsController < ApplicationController
  def index
  end

  def new
    @prefectures = Prefecture.all
  end

  def create
    Post.create(post_params)
  end 

  def show
  end

  def buy
  end

  private
  
  def post_params
    params.require(:post).permit(:product_name,
                                 :product_description,
                                 :first_category_id,
                                 :second_category_id,
                                 :third_category_id,
                                 :brand_id,
                                 :product_size,
                                 :product_condition,
                                 :delivery_fee,
                                 :delivery_former_area,
                                 :delivery_date,
                                 :product_price,
                                 :user_id,
                                 )
  end
end
