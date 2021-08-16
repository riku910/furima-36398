# テーブル設計

## usersテーブル
| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| email           | string | null: false, unique: true |
| password        | string | null: false |
| nickname        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth_day       | string | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :purchases


## itemsテーブル
| Colum           | Type       | Options                        |
| --------------- | -----------| ------------------------------ |
| title           | string     | null: false                    |
| detail          | text       | null: false                    |
| price           | string     | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| shipping_price  | string     | null: false                    |
| delivery_source | string     | null: false                    |
| shipping_day    | string     | null: false                    |
| status          | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase
- has_many :comments


## commentsテーブル
| Colum | Type       | Options 
| ----- | ---------- | ------------------------------ |
| text  | text       | null: false                    |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


## purchasesテーブル
| Colum     | Type       | Options 
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address


## addressesテーブル
| Colum           | Type       | Options                        |
| --------------- | -----------| ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture      | string     | null: false                    |
| municipalities  | string     | null: false                    |
| building_name   | string     | null: false                    |
| tel             | integer    | null: false                    |
| purchase        | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase