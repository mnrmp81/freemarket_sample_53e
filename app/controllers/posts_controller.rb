class PostsController < ApplicationController
  def index
  end

  def new
    @prefectures = Prefecture.all
  end

  def show
  end

  def buy
  end
end
