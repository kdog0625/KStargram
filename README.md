# KStargram

KStargramはファッションコーディネートアプリです。

# 主な機能
## ユーザー登録




## 投稿
## 閲覧
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
