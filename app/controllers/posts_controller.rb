class PostsController < ApplicationController
  def index
  end

  def new
    @prefectures = Prefecture.all
  end

end
