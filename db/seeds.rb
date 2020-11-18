# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(name:'French')
Category.create(name:'Italian')
Category.create(name:'Korean')
Category.create(name:'Japanese')
Category.create(name:'Greek')
Category.create(name:'Fusion')
Category.create(name:'American')
User.create(email:'admin@admin.com',password:'123456',name:'admin_profile')

