# アプリケーション名
Furima

<br>

# 概要
テックキャンプの最終課題にて作成したフリーマーケットのアプリケーション

<br>

# URL
https://befriends-28755.herokuapp.com/

<br>

# 実装内容
商品一覧表示、詳細表示、出品、編集、削除、購入等、フリーマーケットを実現できるために必要な機能を実装

<br>

# 利用方法

## 基本操作概要
- 出品機能
  - 下記、出品者用アカウントでログイン→トップページから出品ボタン押下→商品出品
- 購入機能
  - 下記、購入者用アカウントでログイン→トップページの商品一覧から商品を選択し、商品詳細表示→購入ボタン押下→下記購入者用カード情報、住所情報を入力し購入完了

## Basic認証
ユーザー名: admin  
パスワード: password

<br>

## テスト用ログインアカウント
### 出品者用アカウント
Eメール: seller@mail.com  
パスワード：password123

<br>

### 購入者用アカウント
Eメール: purchaser@mail.com  
パスワード：password123

<br>

### 購入用カード情報
カード番号：4242424242424242
期限：12/24
セキュリティコード：123

<br>


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
| birthday         | date    | null: false  |

### Association

- has_many :items
- has_many :item_managements


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ------     | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| name          | string     | null: false                    |
| description   | string     | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| delv_fee_id   | integer    | null: false                    |
| delv_from_id  | integer    | null: false                    |
| delv_time_id  | integer    | null: false                    |
| price         | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :item_management


## item_managements テーブル
| Column        | Type       | Options                        |
| ------------- | ------     | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_management | references | null: false, foreign_key: true |
| zip_code        | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| lot_number      | string     | null: false                    |
| building_name   | string     |                                |
| telephone       | string     | null: false                    |

### Association

- belongs_to :item_management



