class MypagesController < ApplicationController

  def index
  end

  def profile
  end

  def deliver_address
  end

  def verified_card
  end

  def card
  end

  def create_card
  end

  def logout
  end

  def identification
  def edit
  end 

  def telephone_number
  end

  def email_password
    @user = User.find(current_user.id)
  
  end

end
