＃テーブル設計

## Usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_reading  | string  | null: false |
| first_name_reading | string  | null: false |
| birth_date         | date    | null: false |


### Association

- has_many :items
- has_many :purchases

## Itemsテーブル

| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| title             | string     | null: false       |
| detail            | text       | null: false       |
| category_id       | integer    | null: false       |
| condition_id      | integer    | null: false       |
| handling_payer_id | integer    | null: false       |
| prefecture_id     | integer    | null: false       |
| lead_time_id      | integer    | null: false       |
| price             | integer    | null: false       |
| user              | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## Purchasesテーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## Addressesテーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| postal_code     | string     | null: false       |
| prefecture_id   | integer    | null: false       |
| city            | string     | null: false       |
| house_number    | string     | null: false       |
| building_number | string     |                   |
| phone_number    | string     | null: false       |
| purchase        | references | foreign_key: true |

### Association
- belongs_to :purchase