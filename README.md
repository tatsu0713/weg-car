# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



# テーブル設計

## users テーブル

| Column             |  Type   | Options      |
| ------------------ | --------| -------------|
| nickname           | string  | null: false  |
| email              | string  | null: false  |
| encrypted_password | string  | null: false  |
| favorite_car_id    | integer | null: false  |

### Association
- has_many :tweets
- has_many :comments
- belongs_to_active_hash :favorite_car





## tweets テーブル

| Column             |  Type      | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| brand_id           | integer    | null: false                    |
| type_id            | integer    | null: false                    |
| model_year_id      | integer    | null: false                    |
| title              | string     | null: false                    |
| caption            | text       | null: false                    |


### Association
- belongs_to :user
- has_many :comments
- belongs_to_active_hash :brand
- belongs_to_active_hash :type
- belomgs_to_active_hash :model_year




## comments テーブル

| Column             |  Type      | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| tweet              | references | null: false, foreign_key: true |
| text               | text       | null: false                    |



### Association
- belongs_to :user
- belongs_to :tweet



