namespace :dev do
  task fake_comment: :environment do
    Restaurant.all.each do |restaurant|
      5.times do |i|
        restaurant.comments.create!(
          content: FFaker::LoremCN.sentence,
          user: User.all.sample
        )
      end
      puts "已成功建立假評論 #{Comment.count}"
    end
  end
end