FactoryBot.define do  
  
  factory :post, class: Post do
    product_name {"product"}
    product_description {"good"}
    first_category_id {2}
    second_category_id {2}
    third_category_id {0}
    product_condition {3}
    delivery_fee {1}
    delivery_former_area {3}
    delivery_date {1}
    product_price {800}
    product_size {1}
    delivery_method {1}
    brand_name {"vvv"}
    user
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    after(:build) do |post|
      post.images << build(:image, post: post)
    end
  end

  factory :image, class: Image do
    association :post
    image{File.open("#{Rails.root}/public/uploads/image/image/12/test_image.jpg")}
  end

end