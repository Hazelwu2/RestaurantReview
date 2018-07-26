# 餐廳評論網 | Restaurant Review Website
- 使用 Ruby 2.4.1 version
- [Demo](https://restaurant-forum-hazel-wu.herokuapp.com)
- 部署在 Heroku 上，因是免費版必須休息6小時規定，喚醒需要時間，故開啟網站速度會有點慢，請多包涵
## 功能

1. 分為前後台
2. 後台含有 CRUD，可 CRUD 餐廳資料、分類標籤
3. 前台可根據分類標籤（例：日式料理），來篩選餐廳列表
4. 使用者可以評論該餐廳的評價，後台Admin可以刪除任何人的評論
5. 使用者能夠編輯個人資料及瀏覽別人的個人檔案
6. 使用者能瀏覽自己、其他人評論過的餐廳資料
7. 使用者可瀏覽最近新增的餐廳、最新的評論
8. 使用者瀏覽餐廳詳情時，能夠近一步查看餐廳的優惠活動
9. 使用者能夠收藏餐廳

## 如何使用
安裝相關Gem套件，建立假資料：餐廳、使用者、評論

```
git clone https://github.com/Hazelwu2/RestaurantReview.git
cd project
bundle install
rails db:seed
rails dev:fake_restaurant
rails dev:fake_user
rails dev:fake_comment 
rails s
```

## 如何進入後台
預設Admin帳號
帳號：test@test.com
密碼：test.com