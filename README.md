# KStargram
![image](https://user-images.githubusercontent.com/60535810/83911138-be757580-a7a6-11ea-8b19-ffd24be8137e.png)

KStargramはファッションコーディネートアプリです。

# 主な機能
## ユーザー登録
![image](https://user-images.githubusercontent.com/60535810/83911458-42c7f880-a7a7-11ea-937b-ba744d524e9e.png)

ユーザID、ユーザ名、メールアドレス、パスワードを入力することでユーザ登録ができます。また、人のアイコンをクリックすると各種設定を行う事ができます。

また、ユーザー登録不要のゲストログインも可能です。ページ上部のヘッダーから簡単にゲストログインできます。 ゲストユーザーは本登録ユーザーと同様の機能が使えます(メールアドレス、ユーザ名変更、退会のみ不可)





## 投稿

![image](https://user-images.githubusercontent.com/60535810/83911812-e6190d80-a7a7-11ea-8bde-17686f033d46.png)


## 閲覧

![image](https://user-images.githubusercontent.com/60535810/83933699-d7514b80-a7e5-11ea-8649-ba3ff2a74f61.png)

## フォロー
## 検索
## いいね機能
## ランキング

# KStargram DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|usernoid|string|null: false|
|email|string|null: false|
|password|string|null: false|
|profile|text||
|image|text||
|sex|string||
|age|integer||
|tall|integer||

### Association
- has_many :twees
- has_many :comments
- has_many :likes
- has_many :relationships

## tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|text|null: false|
|sex|string|null: false|
|tall|integer|null: false|
|season|string|null: false|
|image|text|null: false|
|temp|integer|null: false|
|typestyle|string|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- has_many :likes

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|
### Association
- belong_to :tweet
- belong_to :user,  

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :tweet
- belongs_to :user

## relationshipsテーブル
|Column|Type|Options|
|------|----|-------|
|follower_id|integer|null: false, foreign_key: true|
|following_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
