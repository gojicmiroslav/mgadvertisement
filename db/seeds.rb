# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Users
User.create!(	firstname: "Miroslav",
							lastname: "Gojic",
							email: "miroslavy2k@gmail.com",
							password: "deronje777",
							password_confirmation: "deronje777",
							confirmed_at: Time.zone.now )

User.create!(	firstname: "Pera",
							lastname: "Peric",
							email: "pera@gmail.com",
							password: "deronje777",
							password_confirmation: "deronje777",
							confirmed_at: Time.zone.now )
