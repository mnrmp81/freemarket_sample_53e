class Post < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  #   belongs_to_active_hash :prefecture
  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  enum product_size:{ xxs_or_less: 0, xs: 1, small: 2, middle: 3, large: 4, xl: 5, xxl: 6, xxxl: 7, xxxxl_or_more: 8, free: 9 }
  enum product_condition:{ cond_s: 0, cond_a: 1, cond_b: 2, cond_c: 3, cond_d: 4, cond_e: 5 }
  enum delivery_fee:{ included: 0, cash_on_delivery: 1 }
  enum delivery_date:{ one_or_two_days: 0, two_or_three_days: 1, within_a_week:2 }
  enum product_status:{ listing: 0, stopping_listing: 1, in_transaction: 2, sold: 3 }
end
