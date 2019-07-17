# README

## users

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
|avatar|string||

### Assosiation
- has_many :orders
- has_many :posts
- has_many :comments
- has_one :profile, dependent: :destroy
- has_one :address, dependent: :destroy
- has_many :credit_cards, dependent: :destroy


## profiles

|Column|Type|Options|
|------|----|-------|
|profile|text||
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|phone_number|string|null: false, unique: true|
|user_id|references|null: false, foreign_key: true|

### Assosiation
- belongs_to :user


## address

|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture_id|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string|null: false|
|user_id|references|null: false, foreign_key: true|

### Assosiation
- belongs_to :user


## credit_cards

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|costomer_id|integer|null: false|
|card_id|integer|null: false|

### Assosiation
- belongs_to :user


## orders

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|post_id|references|null: false, foreign_key: true|
|charge_id|string|null: false|

### Assosiation
- belongs_to :user
- belongs_to :post


## posts

|Column|Type|Options|
|------|----|-------|
|product_name|string|null: false|
|product_description|text|null: false|
|first_category_id|integer|null: false|
|second_category_id|integer|null: false|
|third_category_id|integer||
|brand_name|string||
|product_size|integer||
|product_condition|integer|null: false|
|delivery_fee|integer|null: false|
|delivery_method|integer|null: false|
|delivery_former_area|string|null: false|
|delivery_date|integer|null: false|
|product_price|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|product_status|integer|default: 0|

### Assosiation
- belongs_to :user
- has_one :order
- has_many :comments, dependent: :destroy
- has_many :images, dependent: :destroy
- has_one :brand
- has_many :categories

### Index
- add_index posts, :prduct_name

## enum
- enum product_size
- enum product_condition
- enum delivery_fee
- enum delivery_date
- enum product_status


## images

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|post_id|references|null: false, foreign_key: true|

### Assosiation
- belongs_to :post

## categories

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Assosiation
- belongs_to :post 