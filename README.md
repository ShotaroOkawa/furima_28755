# テーブル設計

## users テーブル

| Column           | Type    | Options      |
| ---------------- | ------- | ------------ |
| nickname         | string  | null: false  |
| email            | string  | null: false  |
| password         | string  | null: false  |
| family_name      | string  | null: false  |
| first_name       | string  | null: false  |
| family_name_kana | string  | null: false  |
| first_name_kana  | string  | null: false  |
| birth_year       | integer | null: false  |
| birth_month      | integer | null: false  |
| birth_day        | integer | null: false  |

### Association

- has_many :items
- has_many :purchase_infos 

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ------     | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| name          | string     | null: false                    |
| description   | string     | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| delivery_fee  | string     | null: false                    |
| delivery_from | string     | null: false                    |
| delivery_time | string     | null: false                    |
| price         | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :purchase_info

## purchase_infos テーブル

| Column        | Type       | Options                        |
| ------------- | ------     | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| item_id       | string     | null: false, foreign_key: true |
| card_number   | integer    | null: false                    |
| expiry_date   | integer    | null: false                    |
| security_code | integer    | null: false                    |
| zip_code      | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| lot_number    | string     | null: false                    |
| building_name | string     |                                |
| telephone     | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :item 


