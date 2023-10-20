# テーブル設計

## users テーブル

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| profile            | text   |             |


### Association
- has_many :goals
- has_many :posts


## goals

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| purpose    | text       | null: false                    |
| goal       | text       | null: false                    |
| action     | text       | null; false                    |
| deadline   | date       | null; false                    |
| user       | references | null: false, foreign_key: true |

### Association
- has_many :posts
- belongs_to :goal


## posts

| Colum     | Type       | Options                        |
|-----------|------------|--------------------------------|
| content   | text       | null: false                    |
| image     | string     | null: false                    |
| goal      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- belongs_to :goals