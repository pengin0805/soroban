# アプリ名
soroban-35236

# 概要
小学生低学年向けのそろばん入門アプリです。<br>
答え合わせつきの九九のドリルやそろばんの使い方を動画で学べます。

# 本番環境
https://soroban-35236.herokuapp.com/

### Basic認証
※現在、Basic認証を非表示にしています。
・ユーザー名：pengin
・パスワード：1111

### ログイン情報
・Eメール：test@test
・パスワード：111111

# 目指した課題解決
小学生低学年向けにそろばんの入門をしやすくしました。<br>
そろばんを始めてみようと検索すると、ドリル本の購入やそろばん教室の案内ばかりです。<br>
また、一度計算の仕方を覚えてしまえば、後はひたすら問題を解いて、級を上げていくのみです。<br>
お家のPCとそろばんがあれば始められるアプリを目指しました。

# 洗い出した要件定義
## ①学習機能
### 【九九のドリル】
[![Image from Gyazo](https://i.gyazo.com/ab61ceb6314a292031d7413d506dcab1.gif)](https://gyazo.com/ab61ceb6314a292031d7413d506dcab1)
九九は3問のドリル形式になっています。<br>
答えを入力して、＜答え合わせ＞を押すと◯✕判定されます。<br>
＜問題を変える＞を押すと、問題が変わります。

### 【そろばんのたし算】
[![Image from Gyazo](https://i.gyazo.com/9b0dfed7332dc3f44f809faa4e701a0c.gif)](https://gyazo.com/9b0dfed7332dc3f44f809faa4e701a0c)
そろばんの使い方では、動画を再生して学ぶことができます。

## ②カレンダー
[![Image from Gyazo](https://i.gyazo.com/d08aef8f74ff2f128fae615333af615a.png)](https://gyazo.com/d08aef8f74ff2f128fae615333af615a)
ドリルを行った日にカレンダーの日付が水色に塗られます。<br>
毎日の学習を習慣づける（カレンダーの日付に色を塗りたい？）ための機能です。

## ③検索機能
[![Image from Gyazo](https://i.gyazo.com/98708e831a3379b791726e34c11f5744.gif)](https://gyazo.com/98708e831a3379b791726e34c11f5744)
学習内容の一覧をプルダウン形式で表示して、目的の学習内容を探しやすくしています。

## ④定期購入機能
[![Image from Gyazo](https://i.gyazo.com/508fb4ecd3903ac7b92506923e97ba2e.gif)](https://gyazo.com/508fb4ecd3903ac7b92506923e97ba2e)
クレジットカードを用いて、アプリケーションを利用するための定期購入（¥50/月）を実装しました。

# 課題
・カレンダーのドリル実施日の色付けが、1日分しか保存できていないです。<br>
　localStorageに同じ変数で複数の値を保存（配列？）できるように修正します。<br>
・ユーザー毎に保存の値をかえられていないため、変えられるようにします。(cookie?)<br>
　
# DB設計
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

# 開発環境

## バックエンド
Ruby , Ruby on Rails 

## フロントエンド
HTML , CSS , JavaScript , Ajax

## データベース
SequelPro

## インフラ
Heroku

## ソース管理
GitHub , GitHubDesktop

## テスト
RSpec

## エディタ
VSCode



