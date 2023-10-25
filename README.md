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
- has_many :comments
- has_many :likes
- has_many :reminds
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages


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
| goal      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |


### Association
- has_many :posts
- has_many :likes
- has_many :reminds
- belongs_to :users
- belongs_to :goals

## comments

| Colum     | Type       | Options                        |
|-----------|------------|--------------------------------|
| content   | text       | null: false                    |
| post      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- belongs_to :posts

## likes

| Colum     | Type       | Options                        |
|-----------|------------|--------------------------------|
| post      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- belongs_to :posts

## reminds

| Colum     | Type       | Options                        |
|-----------|------------|--------------------------------|
| rimind    | date       | null: false                    |
| post      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- belongs_to :posts

## rooms

| Colum     | Type       | Options                        |
|-----------|------------|--------------------------------|
| name      | string     | null: false                    |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

## room_users

| Colum     | Type       | Options                        |
|-----------|------------|--------------------------------|
| room      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- belongs_to :rooms


## messages

| Colum     | Type       | Options                        |
|-----------|------------|--------------------------------|
| content   | text       | null: false                    |
| room      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- belongs_to :rooms