# 餐廳評論網 | Restaurant Review Website
- Use Ruby 2.4.1 version
- [Demo](https://restaurant-forum-hazel-wu.herokuapp.com)

## 功能

1. 分為前後台
2. 後台含有 CRUD，可 CRUD 餐廳資料、分類標籤
3. 前台可根據分類標籤（例：日式料理），來篩選餐廳列表
4. 使用者可以評論該餐廳的評價，後台Admin可以刪除任何人的評論

## 如何使用
安裝相關Gem套件，建立假資料：餐廳、使用者、評論

```
git clone https://github.com/Hazelwu2/RestaurantReview.git
cd project
bundle install
rails dev:fake_restaurant
rails dev:fake_user
rails dev:fake_comment 
rails db:seed
rails s
```

## 如何進入後台
預設Admin
帳號：test@test.com
密碼：test.com