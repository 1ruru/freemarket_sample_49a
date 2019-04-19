# README

## users table

| Column                | Type     | Option                                     |
|-----------------------|----------|--------------------------------------------|
| nickname              | string   | null: false, add_index: true, unique: true |
| mail                  | string   | null: false, add_index: true, unique: true |
| password              | string   | null: false                                |
| password_confirmation | string   | null: false                                |
| family_name           | string   | null: false                                |
| first_name            | string   | null: false                                |
| family_name_kana      | string   | null: false                                |
| first_name_kana       | string   | null: false                                |
| birthday              | datetime | null: false                                |
| phone                 | string   | null: false                                |
| sex                   | string   |                                            |

### Association

- has_many :items

- has_many :payments

- has_many :addresses

- has_many :notifications

- has_many :likes

## items table

| Column          | Type       | Option                       |
|-----------------|------------|------------------------------|
| name            | string     | null: false, add_index: true |
| description     | text       | null: false                  |
| size            | string     | null: false, default: ""     |
| status          | integer(enum)     | null:false            |
| responsibillity | boolean    | null:false                   |
| delivery_method | references | null:false                   |
| shipping_agency | string     | null:false                   |
| duration        | string     | null:false                   |
| price           | integer    | null:false                   |
| profit          | integer    | null:false                   |
| draft           | boolean    | null:false                   |
| sold_out        | boolean    | null:false, default: false   |
| user             | references | null: false, foreign_key: true |

### Association

- has_many :categories

- has_many :likes

- belongs_to :user

## payments table

| Column          | Type     | Option                    |
|-----------------|----------|---------------------------|
| number          | string   | null: false, unique: true |
| cvc             | string   | null: false               |
| expiration_date | datetime | null: false               |
| name            | string   | null: false               |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## addresses table

| Column           | Type       | Option                         |
|------------------|------------|--------------------------------|
| family_name      | string     | null: false                    |
| first_name       | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| postal_code      | string     | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| house            | string     | null: false                    |
| building         | string     |                                |
| phone            | string     |                                |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## notifications table

| Column     | Type       | Option                         |
|------------|------------|--------------------------------|
| title      | string     | null: false                    |
| body       | text       | null: false                    |
| created_at | datetime   | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## likes table

| Column | Type       | Option                         |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user

- belongs_to :item

## categories table

| Column    | Type    | Option                   |
|-----------|---------|--------------------------|
| name      | string  | null: false              |
| parent_id | integer | null: false, index: true |

### Association

- has_one :brand

## brands table

| Column    | Type       | Option                         |
|-----------|------------|--------------------------------|
| name      | string     | null: false                    |
| parent_id | integer    | null: false, index: true       |
| category  | references | null: false, foreign_key: true |

### Association

- belongs_to :category

## delivery_methods  table

| Column     | Type       | Option                         |
|------------|------------|--------------------------------|
| name       | string     | null: false                    |
| commission | integer    | null: false                    |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :item