class Post < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  #   belongs_to_active_hash :prefecture
  belongs_to :user
  has_one :order
  has_many:images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  
  validates :product_price, numericality: { only_integer: true, greater_than_or_equal_to: 300 , less_than_or_equal_to: 9999999}

  validate :add_error_message
 
  def add_error_message
    if images.blank?
      errors[:images] << "がありません"
    end

    if product_name.blank?
      errors[:product_name] << "を入力して下さい"
    end

    if product_description.blank?
      errors[:product_description] << "を入力して下さい"
    end

    if first_category_id.blank?
      errors[:first_category_id] << "選択して下さい"
    end

    if second_category_id.blank?
      errors[:second_category_id] << "選択して下さい"
    end

    if product_condition.blank?
      errors[:product_condition] << "選択して下さい"
    end

    if delivery_fee.blank?
      errors[:delivery_fee] << "選択して下さい"
    end

    if delivery_method.blank?
      errors[:delivery_method] << "選択して下さい"
    end

    if delivery_former_area.blank?
      errors[:delivery_former_area] << "選択して下さい"
    end

    if delivery_date.blank?
      errors[:delivery_date] << "選択して下さい"
    end

  end

  validates :product_name, length: { maximum: 40 }
  validates :product_description, length: { maximum: 1000 }
  validates :product_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  
  enum product_size:{ xxs_or_less: 0, xs: 1, small: 2, middle: 3, large: 4, xl: 5, xxl: 6, xxxl: 7, xxxxl_or_more: 8, free: 9 }
  enum product_condition:{ cond_s: 0, cond_a: 1, cond_b: 2, cond_c: 3, cond_d: 4, cond_e: 5 }
  enum delivery_fee:{ included: 0, cash_on_delivery: 1 }
  enum delivery_date:{ one_or_two_days: 0, two_or_three_days: 1, within_a_week:2 }
  enum product_status:{ listing: 0, stopping_listing: 1, in_transaction: 2, completed_transaction: 3 }
end
