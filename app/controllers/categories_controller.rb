class CategoriesController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @parent = Category.all.order("ancestry ASC").limit(13)
  end

  def show
  end

end
