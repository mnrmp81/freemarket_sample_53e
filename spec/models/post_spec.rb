require 'rails_helper'

describe Post do
  describe '#create' do

    it "is invalid without a product_name" do
      post = build(:post, product_name:"")
      post.valid?
      expect(post.errors[:product_name]).to include("を入力してください")
    end

    it "is invalid without a product_description" do
      post = build(:post, product_description:"")
      post.valid?
      expect(post.errors[:product_description]).to include("を入力してください")
    end

    it "is invalid without a first_category_id" do
      post = build(:post, first_category_id:"")
      post.valid?
      expect(post.errors[:first_category_id]).to include("を入力してください")
    end

    it "is invalid without a second_category_id" do
      post = build(:post, second_category_id:"")
      post.valid?
      expect(post.errors[:second_category_id]).to include("を入力してください")
    end

    it "is invalid without a product_condition" do
      post = build(:post, product_condition: "")
      post.valid?
      expect(post.errors[:product_condition]).to include("を入力してください")
    end

    it "is invalid without a delivery_fee" do
      post = build(:post, delivery_fee:"")
      post.valid?
      expect(post.errors[:delivery_fee]).to include("を入力してください")
    end

    it "is invalid without a delivery_former_area" do
      post = build(:post, delivery_former_area:"")
      post.valid?
      expect(post.errors[:delivery_former_area]).to include("を入力してください")
    end

    it "is invalid without a delivery_date" do
      post = build(:post, delivery_date:"")
      post.valid?
      expect(post.errors[:delivery_date]).to include("を入力してください")
    end

    it "is invalid without a product_price" do
      post = build(:post, product_price:"")
      post.valid?
      expect(post.errors[:product_price]).to include("を入力してください")
    end
    
    it "is invalid without a product_price less than 300" do
      post = build(:post, product_price:"299")
      post.valid?
      expect(post.errors[:product_price]).to include("は300以上の値にしてください")
    end

    it "is invalid without a product_price over 10000000" do
      post = build(:post, product_price:"10000000")
      post.valid?
      expect(post.errors[:product_price]).to include("は9999999以下の値にしてください")
    end

  end
end

