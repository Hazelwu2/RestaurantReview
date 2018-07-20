namespace :dev do
  task fake_user: :environment do
    User.destroy_all
    
    User.create!(
      email: "test@test.com",
      password: "test.com",
      role: "admin"
    )
    20.times do |user|
      user_name = FFaker::Name.first_name
      User.create!(
        email: FFaker::Internet.free_email,
        password: "test.com"
      )
    end
    puts "已成功創建 #{User.count} 個假 User"
    puts "已成功創建 AdminUser，帳：test@test.com，密：test.com"
  end
end