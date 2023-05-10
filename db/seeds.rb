require 'faker'

puts "🔥 Clearing the garden..."

ActiveRecord::Base.connection.tables.each do |table|
    ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = '#{table}'")
end

puts "🌱 Seeding spices..."

countries = []
10.times do |i|
    countries << "Country#{i + 1}"
end

50.times do
    City.create(
      name: Faker::Address.unique.city,
      population: Random.new.rand(10_000...1_000_000),
      image: Faker::LoremFlickr.image(size: "160x120", search_terms: ["city"]),
      country: countries.sample
    )
  end
  

200.times do
    Post.create(
        city_id: Random.new.rand(1...50),
        category: ["general", "activity"].sample,
        title: Faker::Lorem.sentence(word_count: 5),
        body: Faker::Lorem.paragraphs(number: rand(1..5)).join("\n\n"),
        created_at: Faker::Time.between(from: DateTime.now - 365, to: DateTime.now)
    )
end

puts "✅ Done seeding!"
