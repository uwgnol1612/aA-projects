# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



cat_1 = Cat.create!(name: '1_Bagel', birth_date: '2017/5/21', sex: 'F', color: 'white', description: '1_she is evil')

cat_2 = Cat.create!(name: '2_Jasmine', birth_date: '2015/5/21', sex: 'F', color: 'black', description: '2_she is cute')

cat_3 = Cat.create!(name: '3_Lola', birth_date: '2018/01/01', sex: 'M', color: 'grey', description: '3_He is Tommys Dog')

