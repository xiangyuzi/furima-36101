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
| birth_date_y       | integer | null: false |
| birth_date_m       | integer | null: false |
| birth_date_d       | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## Itemsテーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| title          | string     | null: false |
| detail         | text       | null: false |
| category       | integer    | null: false |
| condition      | integer    | null: false |
| handling_payer | integer    | null: false |
| address_from   | integer    | null: false |
| lead_time      | integer    | null: false |
| price          | integer    | null: false |
| sell_user      | references |             |

### Association

- belongs_to :user
- has_one :purchase

## Purchasesテーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| bought_user | references |             |
| bought_item | references |             |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## Addressesテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     | null: false |
| prefecture    | integer    | null: false |
| city          | string     | null: false |
| house_number  | string     | null: false |
| building_name | string     |             |
| phone_number  | string     | null: false |
| purchase      | references |             |

### Association
- belongs_to :purchase