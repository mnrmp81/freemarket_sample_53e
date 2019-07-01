class PostsController < ApplicationController
  def index
  end

  def new
    @prefectures = Prefecture.all
    @post = Post.new
  end

  def create
    binding.pry
  end

  def show
  end

  def buy
  end
end
