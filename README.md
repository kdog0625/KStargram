# KStargram
![image](https://user-images.githubusercontent.com/60535810/84731315-71c64180-afd3-11ea-8af2-d13240b062c6.png)

KStargramは普段着る服や気温によってどのような服装をするか等をピックアップして記録、共有できるファッションコーディネートアプリです。

普段着る服や気温によって着る服装をピックアップして記録、共有できるファッションコーディネートアプリです。
サービスを快適にお使い頂くために各種機能を実装しました。 

■実装理由 
私服通勤の方、日常生活でどのような服装をするか迷う方が多いのではと思い、そのような悩みを解決するために今回のファッションコーディネートアプリを実装しました。


# 主な機能
## ユーザー登録
![image](https://user-images.githubusercontent.com/60535810/84731992-7986e580-afd5-11ea-83a2-d33ef51d8070.png)

ユーザID、ユーザ名、メールアドレス、パスワードを入力することでユーザ登録ができます。ヘッダー部分にある人のアイコンをクリックすると各種設定を行う事ができます。

また、ユーザー登録不要のゲストログインも可能です。ヘッダーから簡単にゲストログインできます。 ゲストユーザーは本登録ユーザーと同様の機能が使えます(メールアドレス、パスワード、ユーザIDの変更、退会のみ不可)

## 投稿

![image](https://user-images.githubusercontent.com/60535810/84732345-69233a80-afd6-11ea-9c17-5b4d855a80c4.png)

登録したユーザーはヘッダーメニューからコーディネートを投稿する事ができます。 コーディネートには「タイトル」「写真」「気温」「体質」「季節」「性別」「身長」「コーデ概要」の項目があり、それぞれ記載することでコーディネートの投稿が可能です。 

## 閲覧

![image](https://user-images.githubusercontent.com/60535810/84732647-2ca40e80-afd7-11ea-9043-fb64ae2a28a4.png)

投稿されたコーディネートは全てのユーザーが閲覧できます。 登録済みのユーザーは投稿されたコーディネートに「いいね」をつけることができます。気に入ったコーディネートには是非いいねを付けましょう。 また、コーディネートに対してコメントすることも可能です。

## フォロー
![image](https://user-images.githubusercontent.com/60535810/84733030-21051780-afd8-11ea-9959-ad6b3a315ba1.png)

登録済みのユーザーはユーザーを「フォロー」することができます。 フォローすることで、ユーザー情報と実際に投稿したコーディネートをマイページより素早く見る事ができます。

## コーディネート検索

ヘッダーの検索窓からキーワード検索ができます。 キーワードを入力して検索することで、キーワードに関連する「タイトル」「性別」「体質」、「投稿詳細」を探すことができます。 検索を利用してお気に入りのコーディネートを探しましょう。

## ユーザー検索

![image](https://user-images.githubusercontent.com/60535810/84733245-ad173f00-afd8-11ea-9764-648afcc84f87.png)

ユーザー一覧ページより検索窓からユーザーを検索できます。検索を利用してユーザーの投稿しているファッションコーディネートを見つけよう！

## ランキング

オススメのファッションコーディネートをトップページに表示しています。

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
