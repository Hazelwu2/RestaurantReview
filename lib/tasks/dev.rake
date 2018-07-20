namespace :dev do
  task fake_restaurant: :environment do
    Restaurant.destroy_all

    50.times do |i|
      Restaurant.create!(
        name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::LoremCN.paragraph,
        category: Category.all.sample
      )
    end
    puts "Have Created Fake restaurants"
    puts "Now You have #{Restaurant.count} restaurants data"
  end
end