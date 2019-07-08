class MypagesController < ApplicationController
  def index
  end

  def logout
  end

  def identification
  end

  def edit
  end 

  def telephone_number
  end

  def email_password
    @user = User.find(current_user.id)
  end

end
