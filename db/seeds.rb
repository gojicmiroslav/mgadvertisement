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

User.create!(	firstname: "Maja",
							lastname: "Mudrinic",
							email: "maja@gmail.com",
							password: "deronje777",
							password_confirmation: "deronje777",
							confirmed_at: Time.zone.now )

Category.create!(name: "World", 
								 description: "Contrary to popular belief, Lorem Ipsum is not simply random text. 
								 							It has roots in a piece of classical Latin literature from 45 BC, making it 
								 							over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney 
								 							College in Virginia, looked up one of the more obscure Latin words, 
								 							consectetur, from a Lorem Ipsum passage, and going through the cites of the 
								 							word in classical literature, discovered the undoubtable source. 
								 							Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of 
								 							de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, 
								 							written in 45 BC. This book is a treatise on the theory of ethics, 
								 							very popular during the Renaissance. The first line of Lorem Ipsum, 
								 							Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.")

Category.create!(name: "Sport", 
								 description: "Contrary to popular belief, Lorem Ipsum is not simply random text. 
								 							It has roots in a piece of classical Latin literature from 45 BC, making it 
								 							over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney 
								 							College in Virginia, looked up one of the more obscure Latin words, 
								 							consectetur, from a Lorem Ipsum passage, and going through the cites of the 
								 							word in classical literature, discovered the undoubtable source. 
								 							Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of 
								 							de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, 
								 							written in 45 BC. This book is a treatise on the theory of ethics, 
								 							very popular during the Renaissance. The first line of Lorem Ipsum, 
								 							Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.")

Category.create!(name: "Politics", 
								 description: "Contrary to popular belief, Lorem Ipsum is not simply random text. 
								 							It has roots in a piece of classical Latin literature from 45 BC, making it 
								 							over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney 
								 							College in Virginia, looked up one of the more obscure Latin words, 
								 							consectetur, from a Lorem Ipsum passage, and going through the cites of the 
								 							word in classical literature, discovered the undoubtable source. 
								 							Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of 
								 							de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, 
								 							written in 45 BC. This book is a treatise on the theory of ethics, 
								 							very popular during the Renaissance. The first line of Lorem Ipsum, 
								 							Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.")

Category.create!(name: "Economy", 
								 description: "Contrary to popular belief, Lorem Ipsum is not simply random text. 
								 							It has roots in a piece of classical Latin literature from 45 BC, making it 
								 							over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney 
								 							College in Virginia, looked up one of the more obscure Latin words, 
								 							consectetur, from a Lorem Ipsum passage, and going through the cites of the 
								 							word in classical literature, discovered the undoubtable source. 
								 							Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of 
								 							de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, 
								 							written in 45 BC. This book is a treatise on the theory of ethics, 
								 							very popular during the Renaissance. The first line of Lorem Ipsum, 
								 							Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.")

Admin.create!(email: 'miroslavy2k@gmail.com', password: 'deronje777', password_confirmation: 'deronje777')

VehicleBrand.create!(name: "AC")
VehicleBrand.create!(name: "Acura")
VehicleBrand.create!(name: "Alfa Romeo")
VehicleBrand.create!(name: "Alpina")
VehicleBrand.create!(name: "Aro")
VehicleBrand.create!(name: "Asia Motors")
VehicleBrand.create!(name: "Aston Martin")
VehicleBrand.create!(name: "Audi")
VehicleBrand.create!(name: "Austin")
VehicleBrand.create!(name: "Autobianchi")
VehicleBrand.create!(name: "Bentley")
VehicleBrand.create!(name: "BMW")
VehicleBrand.create!(name: "Brilliance")
VehicleBrand.create!(name: "Bugatti")
VehicleBrand.create!(name: "Alfa Romeo")
VehicleBrand.create!(name: "Buick")
VehicleBrand.create!(name: "Cadillack")
VehicleBrand.create!(name: "Chery")
VehicleBrand.create!(name: "Chevrolet")
VehicleBrand.create!(name: "Chrysler")
VehicleBrand.create!(name: "Citroen")
VehicleBrand.create!(name: "Corvette")
VehicleBrand.create!(name: "Dacia")
VehicleBrand.create!(name: "Daewoo")
VehicleBrand.create!(name: "Daihatsu")
VehicleBrand.create!(name: "Dodge")
VehicleBrand.create!(name: "DR")
VehicleBrand.create!(name: "Ferrari")
VehicleBrand.create!(name: "Fiat")
VehicleBrand.create!(name: "Ford")
VehicleBrand.create!(name: "GAZ")
VehicleBrand.create!(name: "Great Wall")
VehicleBrand.create!(name: "GWC")
VehicleBrand.create!(name: "GWM")
VehicleBrand.create!(name: "Honda")
VehicleBrand.create!(name: "Hummer")
VehicleBrand.create!(name: "Hyundai")
VehicleBrand.create!(name: "Infinit")
VehicleBrand.create!(name: "Isuzu")
VehicleBrand.create!(name: "Jaguar")
VehicleBrand.create!(name: "Jeep")
VehicleBrand.create!(name: "Katay Gonow")
VehicleBrand.create!(name: "Kia")
VehicleBrand.create!(name: "Lada")
VehicleBrand.create!(name: "Lamborghini")
VehicleBrand.create!(name: "Lancia")
VehicleBrand.create!(name: "Land Rover")
VehicleBrand.create!(name: "Lexus")
VehicleBrand.create!(name: "Ligier")
VehicleBrand.create!(name: "Lincoln")
VehicleBrand.create!(name: "Lotus")
VehicleBrand.create!(name: "Mahindra")
VehicleBrand.create!(name: "Chrysler")
VehicleBrand.create!(name: "Maserati")
VehicleBrand.create!(name: "Maybach")
VehicleBrand.create!(name: "Mazda")
VehicleBrand.create!(name: "Mercedes Benz")
VehicleBrand.create!(name: "Mercury")
VehicleBrand.create!(name: "Mini")
VehicleBrand.create!(name: "MG")
VehicleBrand.create!(name: "Mitsubishi")
VehicleBrand.create!(name: "Moszkvics")
VehicleBrand.create!(name: "Nissan")
VehicleBrand.create!(name: "Oldsmobile")
VehicleBrand.create!(name: "Opel")
VehicleBrand.create!(name: "Perodua")
VehicleBrand.create!(name: "Peugeot")
VehicleBrand.create!(name: "Piaggio")
VehicleBrand.create!(name: "Plymouth")
VehicleBrand.create!(name: "Polonez")
VehicleBrand.create!(name: "Polski Fiat")
VehicleBrand.create!(name: "Pontiac")
VehicleBrand.create!(name: "Porsche")
VehicleBrand.create!(name: "Proton")
VehicleBrand.create!(name: "Rayton Fissore")
VehicleBrand.create!(name: "Renault")
VehicleBrand.create!(name: "Rolls Royce")
VehicleBrand.create!(name: "Rover")
VehicleBrand.create!(name: "Saab")
VehicleBrand.create!(name: "Shuanghuan")
VehicleBrand.create!(name: "Simca")
VehicleBrand.create!(name: "Smart")
VehicleBrand.create!(name: "Ssan Young")
VehicleBrand.create!(name: "Subaru")
VehicleBrand.create!(name: "Suzuki")
VehicleBrand.create!(name: "Skoda")
VehicleBrand.create!(name: "Talbot")
VehicleBrand.create!(name: "Tata")
VehicleBrand.create!(name: "Tavria")
VehicleBrand.create!(name: "Toyota")
VehicleBrand.create!(name: "Trabant")
VehicleBrand.create!(name: "Triumph")
VehicleBrand.create!(name: "TVR")
VehicleBrand.create!(name: "UAZ")
VehicleBrand.create!(name: "Vauxhall")
VehicleBrand.create!(name: "Volkswagen")
VehicleBrand.create!(name: "Volve")
VehicleBrand.create!(name: "Wartburg")
VehicleBrand.create!(name: "Zastava")
VehicleBrand.create!(name: "Others")
#Bykes
VehicleBrand.create!(name: "Access Motor")
VehicleBrand.create!(name: "Adly")
VehicleBrand.create!(name: "Aeon")
VehicleBrand.create!(name: "AJS")
VehicleBrand.create!(name: "BMW")
VehicleBrand.create!(name: "Renault")