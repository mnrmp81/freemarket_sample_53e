class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_post, only: [:show, :edit, :update, :destroy, :transaction, :buy, :done]

  def index
    @posts = Post.order('id DESC').limit(32)
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

  def new
    @post = Post.new
    10.times { @post.images.build }
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
    @other_posts = @post.user.posts.limit(6).where.not(id: @post.id, product_status: "1")
  end

  def transaction
    @image = Image.find_by(post_id: @post.id)
    # card = current_user.credit_cards.first
    # if card.present?
    #   if Rails.env == 'development'
    #     Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    #   else
    #     Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    #   end
    #   customer = Payjp::Customer.retrieve(card.customer_id)
    #   @default_card_information = customer.cards.retrieve(card.card_id)
    # end
  end

  def buy
    card = current_user.credit_cards.first
    if Rails.env == 'development'
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    end
    charge = Payjp::Charge.create(
      amount: @post.product_price,
      customer: card.customer_id,
      currency: 'jpy'
    )
    order = Order.new(
      user_id: current_user.id,
      post_id: @post.id,
      charge_id: charge.id
    )
    @post.update(post_buy_params)
    if order.save
      redirect_to action: 'done'
    else
      redirect_to action: 'buy'
    end
  end

  def done
    @image = Image.find_by(post_id: @post.id)
  end

  def edit
  end

  def update
    if @post.update(update_post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to listing_mypage_path(current_user), notice: '出品を削除しました'
    else
      render @post
    end
  end

  def done 
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
                                 :delivery_method,
                                 :delivery_former_area,
                                 :delivery_date,
                                 :product_price,
                                 :product_status,
                                 :user_id,
                                 :brand_name,
                                 [images_attributes: [:image]]
                                 ).merge(user_id: current_user.id)
  end

  def update_post_params
    params.require(:post).permit(:product_name,
                                 :product_description,
                                 :first_category_id,
                                 :second_category_id,
                                 :third_category_id,
                                 :brand_id,
                                 :product_size,
                                 :product_condition,
                                 :delivery_fee,
                                 :delivery_method,
                                 :delivery_former_area,
                                 :delivery_date,
                                 :product_price,
                                 :product_status,
                                 :user_id,
                                 :brand_name,
                                 [images_attributes: [:image, :_destroy, :id]]
                                 ).merge(user_id: current_user.id)
  end

  def post_buy_params
    params.require(:post).permit(:product_status)
  end
  
end