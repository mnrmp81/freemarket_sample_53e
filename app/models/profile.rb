class Profile < ApplicationRecord
  belongs_to :user
  # has_one : address
  # accepts_nested_attributes_for :addresses

  validates :family_name, presence: { message: '入力してください' }
  validates :first_name, presence: { message: '入力してください' }
  validates :family_name_kana, presence: { message: '入力してください' }
  validates :family_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'カタカナで入力してください' }, if: ->(u) { u.family_name_kana.present? }
  validates :first_name_kana, presence: { message: '入力してください' }
  validates :first_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'カタカナで入力してください' }, if: ->(u) { u.first_name_kana.present? }
end
