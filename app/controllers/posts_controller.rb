class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.order('id ASC').limit(32)
  end

  def new
    @post = Post.new
    5.times { @post.images.build }
  end

  def create
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to @post, notice: '出品が完了しました'
    else
      render :new
    end
  end 

  def show
    @other_posts = @post.user.posts.limit(6)
    @image = Image.find_by(post_id: @post.id)
  end

  def buy
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to root_path, notice: '出品を停止しました'
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path, notice: '出品を削除しました'
    else
      render @post
    end
  end


  private
  def get_post
    @post = Post.find(params[:id])
  end
  
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
                                 :product_status,
                                 :user_id,
                                 :brand_name,
                                 [images_attributes: [:image]]
                                 ).merge(user_id: current_user.id)
  end

end