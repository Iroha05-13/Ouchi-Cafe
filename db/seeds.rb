# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: "admin.com@mail",
    password: "admin1"
  )

Tag.create([
    {name: "2000円以下"},
    {name: "3000円以下"},
    {name: "4000円以下"},
    {name: "フルーツたっぷり"},
    {name: "焼菓子"},
    {name: "チーズ"},
    {name: "抹茶"}
])
