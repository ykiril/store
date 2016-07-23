# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'ffaker'

# 10.times { Country.create!(name: FFaker::Address.country) }
10.times do
  Author.create!(first_name: 'Kiril',
                 last_name: 'Yershov',
                 biography: '-')  
end

20.times do
    title = FFaker::CheesyLingo.title
    description = FFaker::LoremFR.paragraph(5)
    price = rand(1..50)
    in_stock = rand(1..50)
    image = 'img_book' << rand(1..25).to_s << '.png'
    category_id = 1
    author_id = 1
    Book.create!(title: title,
                  description: description,
                  price: price,
                  image: image,
                  in_stock: in_stock,
                  category_id: category_id,
                  author_id: author_id
                  )
  end