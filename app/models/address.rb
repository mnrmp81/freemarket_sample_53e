class Address < ApplicationRecord
  belongs_to :user

  validates :postal_code, presence: { message: '入力してください' }
  validates :postal_code, length: { is: 7, message: 'フォーマットが正しくありません' }, if: ->(u) { u.postal_code.present? },
    numericality: { only_integer: true, message: '' }
  validates :prefecture, presence: { message: '選択してください' }
  validates :city, presence: { message: '入力してください' }
  validates :block, presence: { message: '入力してください' }
end
