## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname       |string|null:false
|first_name     |string|null:false
|last_name      |string|null:false
|first_name_kana|string|null:false
|last_name_kane |string|null:false
|email          |string|null:false, unique:true
|password       |string|null:false
|birth_year     |string|null:false
|birth_month    |string|null:false
|birth_day      |string|null:false


### Association
has_many :items  
has_many :comments  
has_one :address  


## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name          |string|null:false
|text          |text  |null:false
|price         |integer|null:false
|category_id   |references|null:false,foreign_key:true
|condition     |string|null:false
|delivery_date |string|null:false
|delivery_day  |string|null:false
|prefecture    |string|null:false

### Association
belongs_to :user  
belongs_to :item_image  
has_many :comments  


## Addressesテーブル

|Column|Type|Options|
|------|----|-------|
|first_name     |string|null:false
|last_name      |string|null:false
|first_name_kana|string|null:false
|last_name_kana |string|null:false
|post_code      |string|null:false
|prefecture     |string|null:false
|city           |string|null:false
|address        |string|null:false
|building       |string|          
|telephone      |string|null:false

### Association
belongs_to :user

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null:false
|item   |references|null:false,foreign_key:true
|user   |references|null:false,foreign_key:true

### Association
belongs_to :item  
belongs_to :user  


## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image  |string|null:false
|item_image|references|null:false,foreign_key:true

### Association
belongs_to :item  
