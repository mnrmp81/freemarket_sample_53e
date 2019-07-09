FactoryBot.define do

  factory :post do
    product_name {"product"}
    product_description {"good"}
    first_category_id {1}
    second_category_id {1}
    third_category_id {1}
    product_size {0}
    product_condition {1}
    delivery_fee {1}
    delivery_former_area {1}
    delivery_date {1}
    product_price {800}
    product_status {0}
    brand_name {"vvv"}
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    user
  end

end
