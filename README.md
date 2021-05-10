# テーブル設計

## texts テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| text_name          | string | null: false |
| text_info          | text   | null: false |
| text_class         | string |             |

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| subscription_id    | string |             |
| premium            | string |             |

### Association
- has_one  :card

## cards テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| card_token         | string | null: false |
| customer_token     | string | null: false |
| user               | references | null: false,foreign_key: true |

### Association
- belongs_to  :user

## multiplications テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| formula            | string | null: false |
| answer             | integer| null: false |

