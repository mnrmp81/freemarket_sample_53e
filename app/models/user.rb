class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :posts
  has_many :comments
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_many :credit_cards, dependent: :destroy
  accepts_nested_attributes_for :credit_cards
end
