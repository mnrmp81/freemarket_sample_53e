class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
    @prefectures = Prefecture.all
    # 以下仮作成
    @first_categories = FirstCategory.all
    @second_categories = SecondCategory.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to 'root_path', notice: '出品が完了しました'
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
                                 )
  end
end
