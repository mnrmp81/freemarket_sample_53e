class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
    5.times { @post.images.build }
  end

  def create
    # binding.pry
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to @post, notice: '出品が完了しました'
      # パスは仮置き
    else
      render :new
    end
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
                                 :brand_name,
                                 [images_attributes: [:image]]
                                 ).merge(user_id: current_user.id)
  end

end