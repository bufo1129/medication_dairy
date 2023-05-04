# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@admin',
  password: '000000'
  )

Store.create!(
  email: 'tokyo@tokyo',
  name: '東京タワー店',
  postal_code: '1050011',
  phone_number: '11111111111',
  prefecture_code: '東京都',
  address_city: '市町村',
  address_street: '番地',
  address_building: '建物名',
  password: '111111'
  )
