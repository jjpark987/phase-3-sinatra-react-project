require 'faker'

puts "🔥 Clearing the garden..."

ActiveRecord::Base.connection.tables.each do |table|
    ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = '#{table}'")
end

puts "🌱 Seeding spices..."

25.times do
    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        username: Faker::Internet.username,
        created_at: Faker::Time.between(from: DateTime.now - 730, to: DateTime.now - 365)
    )
end

100.times do
    Post.create(
        user_id: Random.new.rand(1...25),
        city_id: Random.new.rand(1...50),
        title: Faker::Lorem.sentence(word_count: 5),
        category: ["general", "activity"].sample,
        description: Faker::Lorem.paragraphs(number: rand(1..5)).join("\n\n"),
        created_at: Faker::Time.between(from: DateTime.now - 365, to: DateTime.now)
    )
end


50.times do
    City.create(
        country_id: Random.new.rand(1...25),
        name: Faker::Address.unique.city,
        population: Random.new.rand(10_000...1_000_000),
        image: Faker::LoremFlickr.image(search_terms: ["city"], size: "640x480")
    )
end

25.times do
    Country.create(
        name: Faker::Address.unique.country,
        continent: ["Continent1", "Continent2", "Continent3", "Continent4", "Continent5", "Continent6"].sample,
        flag: Faker::LoremFlickr.image(search_terms: ["flag"], size: "600x400")
    )
end

puts "✅ Done seeding!"
