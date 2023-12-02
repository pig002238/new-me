## アプリケーション名
NEW ME

## アプリケーション概要
目標を設定し、その日の行動を投稿することで、目標達成に向けて励むことができる。また、同じ目標を持ったユーザー同士でコミュニケーションをとることで、目標を向けて励まし合うことができる。

## URL
https://new-me-qvwo.onrender.com/

## テスト用アカウント
・メールアドレス : test@test.com

・パスワード : 111111

## アプリケーションを作成した背景
以前に簿記3級取得のため勉強をしようと思ったが、勉強を継続できなかったことを思い出した。
どうしたら勉強を続けられるかを考えたときに、同じ目標を頑張っている人や相談できる場があれば続けられると仮説を立て開発することにした。

## 洗い出した要件
https://docs.google.com/spreadsheets/d/1wg0R-hsgzFUZn_xC4JGSdF7L75OcnvNe/edit#gid=24418142

## 実装した機能についての画像やGIFおよびその説明
・ユーザー管理機能
https://gyazo.com/36e7e4c408a75f952689518e36241d88
https://gyazo.com/b7701dd4595c49f84c7511a7a29f0855

・目標設定
https://gyazo.com/dc2076543e6ef7c2d924f4db1ce898a2


## 実装予定の機能
・リマインド機能
・検索機能
・フォロー機能
・いいね機能
・タイマー機能

## データベース設計
https://gyazo.com/c24f3355fc1c0402e6b729c5e6aa7880

## 画面遷移図	
https://gyazo.com/c10d06382104c226ad6dcdea193c8860






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