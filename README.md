## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname       |string|null:false|
|first_name     |string|null:false|
|last_name      |string|null:false|
|first_name_kana|string|null:false|
|last_name_kane |string|null:false|
|email          |string|null:false, unique:true|
|encrypted_password |string|null:false|
|birth_date     |date  |null:false|


### Association
has_many :buyers  
has_many :items  
has_many :comments  
has_one :address  

## Buyersテーブル

|Column|Type|Options|
|------|----|-------|
|buyer|string|null:false|
|item   |references|null:false,foreign_key:true|

### Association
has_many :comments  


## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name            |string|null:false|
|text            |text  |null:false|
|price           |integer|null:false|
|category_id     |references|null:false,foreign_key:true|
|condition_id    |integer|null:false|
|delivery_charge_id |integer|null:false|
|delivery_day_id |integer|null:false|
|prefecture_id   |integer|null:false|
|user   |references|null:false,foreign_key:true|


### Association
belongs_to :user  
belongs_to :item_image  
has_many :comments  


## Addressesテーブル

|Column|Type|Options|
|------|----|-------|
|post_code      |string|null:false|
|city           |string|null:false|
|address        |string|null:false|
|building       |string|          |
|telephone      |string|null:false|
|prefecture_id  |integer|null:false|


### Association
belongs_to :user

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null:false|
|item   |references|null:false,foreign_key:true|
|user   |references|null:false,foreign_key:true|

### Association
belongs_to :item  
belongs_to :user  
