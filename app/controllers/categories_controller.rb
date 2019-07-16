class CategoriesController < ApplicationController

  def index
    @user = User.find_by(params[:id])
    @parent = Category.all.order("ancestry ASC").limit(13)
  end
  
end
