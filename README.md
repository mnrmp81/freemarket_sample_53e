# README

## users

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
|avatar|string||
|card_number|integer|null: false, unique: true|
|expiration_date|integer|null: false|
|expiration_year|integer|null: false|
|security_code|integer|null: false|

### Assosiation
- has_many :orders
- has_many :posts
- has_many :comments
- has_one :profile
- has_one :address


## profiles

|Column|Type|Options|
|------|----|-------|
|profile|text||
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|phone_number|integer|null: false, unique: true|
|user_id|integer|null: false, foreign_key: true|

### Assosiation
- belongs_to :user


## address

|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Assosiation
- belongs_to :user


## orders

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|

### Assosiation
- belongs_to :user
- belongs_to :post


## posts

|Column|Type|Options|
|------|----|-------|
|product_name|string|null: false|
|product_description|text|null: false|
|first_category_id|integer|null: false, foreign_key: true|
|second_category_id|integer|null: false, foreign_key: true|
|third_category_id|integer|foreign_key: true|
|brand_id|string|foreign_key: true|
|product_size|string||
|product_condition|string|null: false|
|delivery_fee|string|null: false|
|delivery_former_area|string|null: false|
|delivery_date|string|null: false|
|product_price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_status|string|null: false|

### Assosiation
- belongs_to :user
- has_one :order
- has_many :comments
- has_many :images
- has_one :brand
- has_one :first_category
- has_one :second_category
- has_one :third_category

### Index
- add_index posts, :prduct_name


## images

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|post_id|integer|null: false, foreign_key: true|

### Assosiation
- belongs_to :post


## comments

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|post_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Assosiation
- belongs_to :post
- belongs_to :user


## first_categories

|Column|Type|Options|
|------|----|-------|
|first_category|string|null: false, unique: true|

### Assosiation
- belongs_to :post
- has_many :second_categories, through: :first_second_categories
- has_many :first_second_categories


## second_categories

|Column|Type|Options|
|------|----|-------|
|second_category|string|null: false, unique: true|

### Assosiation
- belongs_to :post
- has_many :first_categories, through: :first_second_categories
- has_many :third_categories, through: :second_third_categories
- has_many :first_second_categories
- has_many :second_third_categories


## third_categories

|Column|Type|Options|
|------|----|-------|
|third_category|string|null: false, unique: true|

### Assosiation
- belongs_to :post
- has_many :second_categories, through: :second_third_categories
- has_many :second_third_categories


## first_second_categories

|Column|Type|Options|
|------|----|-------|
|first_category_id|integer|null: false, foreign_key: true|
|second_category_id|integer|null: false, foreign_key: true|

### Assosiation
- belongs_to :first_category
- belongs_to :second_category


## second_third_categories

|Column|Type|Options|
|------|----|-------|
|second_category_id|integer|null: false, foreign_key: true|
|third_category_id|integer|null: false, foreign_key: true|

### Assosiation
- belongs_to :second_category
- belongs_to :third_category


## brands
|Column|Type|Options|
|------|----|-------|
|brand_name|string|null: false|

### Assosiation
- has_many :genres, through: :brand_genres
- has_many :brand_genres


## genres
|Column|Type|Options|
|------|----|-------|
|genre|string|null: false|

### Assosiation
- has_many :brands, through: :brand_genres
- has_many :brand_genres


## brand_genres
|Column|Type|Options|
|------|----|-------|
|brand_id|integer|null: false, forign_key: true|
|genre_id|integer|null: false, forign_key: true|

### Assosiation
- belongs_to :brand
- belongs_to :genre