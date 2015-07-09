# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
5.times do 
  product = Product.create(
    title: "[#{Faker::Lorem.word.capitalize}] " << (Faker::Lorem.words(3).join(" ")).capitalize,
    description: Faker::Lorem.sentence(20),
    category_id: 1,
    price: rand(3000) + 500
  )

  attachment = product.product_attachments.create(
    image: open("http://lorempixel.com/600/600/fashion/"),
    image_type: "main"
  )

  3.times do
    product.product_attachments.create(
      image: open("http://lorempixel.com/600/600/fashion/"),
      image_type: "other"
    )
  end
end


