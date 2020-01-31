# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: 'user', email: 'user@gmail.com', user_type: 'teacher', admin: 'true', 
hobbies: 'programming', self_introduction: 'I like programming and i ca help anyone need it', 
gender: 'male', skills: 'ruby, javascript', age:'25', qualification: 'A0 in computer scince', password: '123456')
