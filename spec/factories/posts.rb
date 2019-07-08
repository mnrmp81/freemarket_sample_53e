FactoryBot.define do
  
  factory :post do 
    product_name            {"あああああ"}
    product_description     {"あああああ"}
    first_category_id       {"0"}
    second_category_id      {"0"}
    product_condition       {"cond_s"}
    delivery_fee            {"included"}
    delivery_former_area    {"0"}
    delivery_date           {"one_or_two_days"}
    product_price           {"0"}
  end

  factory :image do 
    image                   {""}
  end


end
