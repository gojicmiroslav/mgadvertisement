# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

AdvertisementInformation.destroy_all
Advertisement.destroy_all
Item.destroy_all
Information.destroy_all
InformationType.destroy_all
VehicleModel.destroy_all
Category.destroy_all
VehicleBrand.destroy_all
AdvertisementType.destroy_all
User.destroy_all
Admin.destroy_all

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

Category.create!(name: "Cars", 
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

Category.create!(name: "Bicycles", 
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

Category.create!(name: "Trucks", 
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


# CARS
vb = VehicleBrand.new(name: "AC")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Acura")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Alfa Romeo")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Alpina")
vb.categories << Category.find_by(name: "Cars")
vb.save


vb = VehicleBrand.create!(name: "Opel")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Volkswagen")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Aro")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Asia Motors")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Aston Martin")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Audi")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Austin")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Autobianchi")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Bentley")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "BMW")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Brilliance")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Bugatti")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Buick")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Cadillack")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Chery")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Chevrolet")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Chrysler")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Citroen")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Corvette")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Dacia")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Daewoo")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Daihatsu")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Dodge")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "DR")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Ferrari")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Fiat")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Ford")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Honda")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Hyundai")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Isuzu")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Jaguar")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Kia")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Lada")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Lamborghini")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Lancia")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Mazda")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Mercedes Benz")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Mitsubishi")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Moszkvics")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Nissan")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Peugeot")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Porsche")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Renault")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Suzuki")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Skoda")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Toyota")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Wartburg")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Zastava")
vb.categories << Category.find_by(name: "Cars")
vb.save


#Bicycles
vb = VehicleBrand.create!(name: "Boardman")
vb.categories << Category.find_by(name: "Bicycles")
vb.save

vb = VehicleBrand.create!(name: "Carrera")
vb.categories << Category.find_by(name: "Bicycles")
vb.save

vb = VehicleBrand.create!(name: "Apollo")
vb.categories << Category.find_by(name: "Bicycles")
vb.save

vb = VehicleBrand.create!(name: "Raleigh")
vb.categories << Category.find_by(name: "Bicycles")
vb.save

vb = VehicleBrand.create(name: "VooDoo")
vb.categories << Category.find_by(name: "Bicycles")
vb.save

vb = VehicleBrand.create(name: "Lan Rover")
vb.categories << Category.find_by(name: "Bicycles")
vb.save

vb = VehicleBrand.create(name: "Coyote")
vb.categories << Category.find_by(name: "Bicycles")
vb.save

vb = VehicleBrand.create(name: "Boss")
vb.categories << Category.find_by(name: "Bicycles")
vb.save

vb = VehicleBrand.create(name: "Integra")
vb.categories << Category.find_by(name: "Bicycles")
vb.save

vb = VehicleBrand.create(name: "Falcon")
vb.categories << Category.find_by(name: "Bicycles")
vb.save


# TRUCKS
vb = VehicleBrand.create!(name: "FAP")
vb.categories << Category.find_by(name: "Trucks")
vb.save

vb = VehicleBrand.create!(name: "MAN")
vb.categories << Category.find_by(name: "Trucks")
vb.save

vb = VehicleBrand.create!(name: "Iveco")
vb.categories << Category.find_by(name: "Trucks")
vb.save

vb = VehicleBrand.create!(name: "TAM")
vb.categories << Category.find_by(name: "Trucks")
vb.save

vb = VehicleBrand.find_by(name: "Mercedes Benz")
vb.categories << Category.find_by(name: "Trucks")
vb.save

vb = VehicleBrand.find_by(name: "Ford")
vb.categories << Category.find_by(name: "Trucks")
vb.save

vb = VehicleBrand.find_by(name: "Fiat")
vb.categories << Category.find_by(name: "Trucks")
vb.save

vb = VehicleBrand.find_by(name: "Opel")
vb.categories << Category.find_by(name: "Trucks")
vb.save

# VEHICLE MODEL
vm = VehicleModel.new(name: "Astra G")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Opel")
vm.save

vm = VehicleModel.new(name: "Astra F")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Opel")
vm.save

vm = VehicleModel.new(name: "Ascona")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Opel")
vm.save

vm = VehicleModel.new(name: "Astra J")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Opel")
vm.save

vm = VehicleModel.new(name: "Corsa A")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Opel")
vm.save

vm = VehicleModel.new(name: "Corsa B")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Opel")
vm.save

vm = VehicleModel.new(name: "Corsa C")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Opel")
vm.save

vm = VehicleModel.new(name: "Corsa D")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Opel")
vm.save

vm = VehicleModel.new(name: "Calibra")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Opel")
vm.save

vm = VehicleModel.new(name: "Insignia")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Opel")
vm.save

vm = VehicleModel.new(name: "Omega")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Opel")
vm.save

vm = VehicleModel.new(name: "A 140")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "A 150")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "A 160")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "A 170")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "A 180")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "A 190")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "A 200")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "A 210")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "A 220")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "A 230")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "A 240")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "A 250")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "B 150")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "B 160")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "B 170")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "B 180")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "B 190")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "B 200")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "C 180")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "C 200")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "C 220")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "C 230")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "C 240")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "Laguna")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Renault")
vm.save

vm = VehicleModel.new(name: "Kangoo")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Renault")
vm.save

vm = VehicleModel.new(name: "Scenic")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Renault")
vm.save

vm = VehicleModel.new(name: "Spider")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Renault")
vm.save

vm = VehicleModel.new(name: "Twingo")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Renault")
vm.save

# VehicleModel - Trucks
vm = VehicleModel.new(name: "T1")
vm.category = Category.find_by(name: "Trucks")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "T2")
vm.category = Category.find_by(name: "Trucks")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "T3")
vm.category = Category.find_by(name: "Trucks")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "T4")
vm.category = Category.find_by(name: "Trucks")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "F1")
vm.category = Category.find_by(name: "Trucks")
vm.vehicle_brand = VehicleBrand.find_by(name: "FAP")
vm.save

vm = VehicleModel.new(name: "F2")
vm.category = Category.find_by(name: "Trucks")
vm.vehicle_brand = VehicleBrand.find_by(name: "FAP")
vm.save

vm = VehicleModel.new(name: "F3")
vm.category = Category.find_by(name: "Trucks")
vm.vehicle_brand = VehicleBrand.find_by(name: "FAP")
vm.save

vm = VehicleModel.new(name: "F4")
vm.category = Category.find_by(name: "Trucks")
vm.vehicle_brand = VehicleBrand.find_by(name: "FAP")
vm.save

# Bicycles
vm = VehicleModel.new(name: "Boardman Mountain Bike Team 29er")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Boardman")
vm.save

vm = VehicleModel.new(name: "Boardman Mountain Pro 27.5\"")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Boardman")
vm.save

vm = VehicleModel.new(name: "Boardman Mountain Bike Comp 27.5\"")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Boardman")
vm.save

vm = VehicleModel.new(name: "Carrera Vengeance Mens Mountain Bike ")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Carrera")
vm.save

vm = VehicleModel.new(name: "Carrera Fury Mountain Bike")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Carrera")
vm.save

vm = VehicleModel.new(name: "Apollo Spiral Womens Mountain Bike")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Apollo")
vm.save

vm = VehicleModel.new(name: "Apollo Feud Mens Mountain Bike")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Apollo")
vm.save

vm = VehicleModel.new(name: "Coyote Psycho Frenzy 18 Speed")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Coyote")
vm.save

vm = VehicleModel.new(name: "Coyote Fatman Neon Orange/matt Black")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Coyote")
vm.save

vm = VehicleModel.new(name: "Coyote Fatman Neon Pink/matt Black")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand  VehicleBrand.find_by(name: "Coyote")
vm.save

# ADVERTISEMENT TYPE
AdvertisementType.create!(name: "New")
AdvertisementType.create!(name: "Used")

InformationType.create!(name: "Basic")
InformationType.create!(name: "Additional")


info = Information.new(name: "Capacity")
info.information_type = InformationType.find_by(name: "Basic")
cat = Category.find_by(name: "Cars")
info.categories << cat
cat = Category.find_by(name: "Trucks")
info.categories << cat
info.save

info = Information.new(name: "Power")
info.information_type = InformationType.find_by(name: "Basic")
cat = Category.find_by(name: "Cars")
info.categories << cat
cat = Category.find_by(name: "Trucks")
info.categories << cat
info.save

info = Information.new(name: "Mileage")
info.information_type = InformationType.find_by(name: "Basic")
cat = Category.find_by(name: "Cars")
info.categories << cat
cat = Category.find_by(name: "Trucks")
info.categories << cat
info.save

info = Information.new(name: "Type")
info.information_type = InformationType.find_by(name: "Basic")
cat = Category.find_by(name: "Bicycles")
info.categories << cat
info.save

info = Information.new(name: "Fuel")
info.information_type = InformationType.find_by(name: "Additional")
cat = Category.find_by(name: "Cars")
info.categories << cat
cat = Category.find_by(name: "Trucks")
info.categories << cat
info.save

info = Information.new(name: "Drive")
info.information_type = InformationType.find_by(name: "Additional")
cat = Category.find_by(name: "Cars")
info.categories << cat
cat = Category.find_by(name: "Trucks")
info.categories << cat
info.save

info = Information.new(name: "Air Condition")
info.information_type = InformationType.find_by(name: "Additional")
cat = Category.find_by(name: "Cars")
info.categories << cat
cat = Category.find_by(name: "Trucks")
info.categories << cat
info.save

info = Information.new(name: "Style")
info.information_type = InformationType.find_by(name: "Additional")
cat = Category.find_by(name: "Cars")
info.categories << cat
info.save

info = Information.new(name: "Transmission")
info.information_type = InformationType.find_by(name: "Additional")
cat = Category.find_by(name: "Cars")
info.categories << cat
cat = Category.find_by(name: "Trucks")
info.categories << cat
info.save

info = Information.new(name: "Engine")
info.information_type = InformationType.find_by(name: "Additional")
cat = Category.find_by(name: "Cars")
info.categories << cat
cat = Category.find_by(name: "Trucks")
info.categories << cat
info.save

info = Information.new(name: "Color")
info.information_type = InformationType.find_by(name: "Additional")
cat = Category.find_by(name: "Bicycles")
info.categories << cat
info.save

info = Information.new(name: "Breaks")
info.information_type = InformationType.find_by(name: "Additional")
cat = Category.find_by(name: "Bicycles")
info.categories << cat
info.save

info = Information.new(name: "Material")
info.information_type = InformationType.find_by(name: "Additional")
cat = Category.find_by(name: "Bicycles")
info.categories << cat
info.save

info = Information.new(name: "Size")
info.information_type = InformationType.find_by(name: "Additional")
cat = Category.find_by(name: "Bicycles")
info.categories << cat
info.save

info = Information.new(name: "Exterior Color")
info.information_type = InformationType.find_by(name: "Additional")
cat = Category.find_by(name: "Cars")
info.categories << cat
cat = Category.find_by(name: "Trucks")
info.categories << cat
info.save

info = Information.new(name: "Interior Color")
info.information_type = InformationType.find_by(name: "Additional")
cat = Category.find_by(name: "Cars")
info.categories << cat
cat = Category.find_by(name: "Trucks")
info.categories << cat
info.save

info = Information.new(name: "Carrying capacity")
info.information_type = InformationType.find_by(name: "Additional")
cat = Category.find_by(name: "Trucks")
info.categories << cat
info.save

item = Item.new(name: "Commercial")
item.information << Information.find_by(name: "Style")
item.categories << Category.find_by(name: "Cars")
item.save

item = Item.new(name: "Convertible")
item.information << Information.find_by(name: "Style")
item.categories << Category.find_by(name: "Cars")
item.save

item = Item.new(name: "Coupe")
item.information << Information.find_by(name: "Style")
item.categories << Category.find_by(name: "Cars")
item.save

item = Item.new(name: "Hatchback")
item.information << Information.find_by(name: "Style")
item.categories << Category.find_by(name: "Cars")
item.save

item = Item.new(name: "Hybrid/Electric")
item.information << Information.find_by(name: "Style")
item.categories << Category.find_by(name: "Cars")
item.save

item = Item.new(name: "Luxury")
item.information << Information.find_by(name: "Style")
item.categories << Category.find_by(name: "Cars")
item.save

item = Item.new(name: "Sedan")
item.information << Information.find_by(name: "Style")
item.categories << Category.find_by(name: "Cars")
item.save

item = Item.new(name: "SUV/Crossover")
item.information << Information.find_by(name: "Style")
item.categories << Category.find_by(name: "Cars")
item.save

item = Item.new(name: "Van/Minivan")
item.information << Information.find_by(name: "Style")
item.categories << Category.find_by(name: "Cars")
item.save

item = Item.new(name: "Wagon")
item.information << Information.find_by(name: "Style")
item.categories << Category.find_by(name: "Cars")
item.save

item = Item.new(name: "Gasoline")
item.information << Information.find_by(name: "Fuel")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Diesel")
item.information << Information.find_by(name: "Fuel")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Gasoline + Gas(TNG)")
item.information << Information.find_by(name: "Fuel")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Hybrid")
item.information << Information.find_by(name: "Fuel")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Electric")
item.information << Information.find_by(name: "Fuel")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Alternate")
item.information << Information.find_by(name: "Fuel")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Automatic")
item.information << Information.find_by(name: "Transmission")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Manual")
item.information << Information.find_by(name: "Transmission")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Semi-automatic")
item.information << Information.find_by(name: "Transmission")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "CVT")
item.information << Information.find_by(name: "Transmission")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Other")
item.information << Information.find_by(name: "Transmission")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "FWD")
item.information << Information.find_by(name: "Drive")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "RWD")
item.information << Information.find_by(name: "Drive")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "AWD")
item.information << Information.find_by(name: "Drive")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "4WD")
item.information << Information.find_by(name: "Drive")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "4x4")
item.information << Information.find_by(name: "Drive")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "RWD")
item.information << Information.find_by(name: "Drive")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Other")
item.information << Information.find_by(name: "Drive")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "3 cylinder")
item.information << Information.find_by(name: "Engine")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "4 cylinder")
item.information << Information.find_by(name: "Engine")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "5 cylinder")
item.information << Information.find_by(name: "Engine")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "6 cylinder")
item.information << Information.find_by(name: "Engine")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "8 cylinder")
item.information << Information.find_by(name: "Engine")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "10 cylinder")
item.information << Information.find_by(name: "Engine")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "12 cylinder")
item.information << Information.find_by(name: "Engine")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Electric")
item.information << Information.find_by(name: "Engine")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Hybrid")
item.information << Information.find_by(name: "Engine")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Rotary Engine")
item.information << Information.find_by(name: "Engine")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

############Exterior/Interior Color#######################################
item = Item.new(name: "Beige")
item.information << Information.find_by(name: "Exterior Color")
item.information << Information.find_by(name: "Interior Color")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Blue")
item.information << Information.find_by(name: "Exterior Color")
item.information << Information.find_by(name: "Interior Color")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Black")
item.information << Information.find_by(name: "Exterior Color")
item.information << Information.find_by(name: "Interior Color")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Burgundy")
item.information << Information.find_by(name: "Exterior Color")
item.information << Information.find_by(name: "Interior Color")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Charcoal")
item.information << Information.find_by(name: "Exterior Color")
item.information << Information.find_by(name: "Interior Color")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Gold")
item.information << Information.find_by(name: "Exterior Color")
item.information << Information.find_by(name: "Interior Color")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Gray")
item.information << Information.find_by(name: "Exterior Color")
item.information << Information.find_by(name: "Interior Color")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Green")
item.information << Information.find_by(name: "Exterior Color")
item.information << Information.find_by(name: "Interior Color")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Off White")
item.information << Information.find_by(name: "Exterior Color")
item.information << Information.find_by(name: "Interior Color")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Orange")
item.information << Information.find_by(name: "Exterior Color")
item.information << Information.find_by(name: "Interior Color")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Pink")
item.information << Information.find_by(name: "Exterior Color")
item.information << Information.find_by(name: "Interior Color")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Red")
item.information << Information.find_by(name: "Exterior Color")
item.information << Information.find_by(name: "Interior Color")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Silver")
item.information << Information.find_by(name: "Exterior Color")
item.information << Information.find_by(name: "Interior Color")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Tan")
item.information << Information.find_by(name: "Exterior Color")
item.information << Information.find_by(name: "Interior Color")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Turquoise")
item.information << Information.find_by(name: "Exterior Color")
item.information << Information.find_by(name: "Interior Color")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "White")
item.information << Information.find_by(name: "Exterior Color")
item.information << Information.find_by(name: "Interior Color")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Yellow")
item.information << Information.find_by(name: "Exterior Color")
item.information << Information.find_by(name: "Interior Color")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

############Color#######################################
item = Item.new(name: "Beige")
item.information << Information.find_by(name: "Color")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Blue")
item.information << Information.find_by(name: "Color")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Black")
item.information << Information.find_by(name: "Color")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Burgundy")
item.information << Information.find_by(name: "Color")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Charcoal")
item.information << Information.find_by(name: "Color")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Gold")
item.information << Information.find_by(name: "Color")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Gray")
item.information << Information.find_by(name: "Color")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Green")
item.information << Information.find_by(name: "Color")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Off White")
item.information << Information.find_by(name: "Color")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Orange")
item.information << Information.find_by(name: "Color")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Pink")
item.information << Information.find_by(name: "Color")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Red")
item.information << Information.find_by(name: "Color")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Silver")
item.information << Information.find_by(name: "Color")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Tan")
item.information << Information.find_by(name: "Color")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Turquoise")
item.information << Information.find_by(name: "Color")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "White")
item.information << Information.find_by(name: "Color")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Yellow")
item.information << Information.find_by(name: "Color")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Automatic")
item.information << Information.find_by(name: "Air Condition")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "Manual")
item.information << Information.find_by(name: "Air Condition")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "None")
item.information << Information.find_by(name: "Air Condition")
item.categories << Category.find_by(name: "Cars")
item.categories << Category.find_by(name: "Trucks")
item.save

item = Item.new(name: "BMX")
item.information << Information.find_by(name: "Type")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Cruiser")
item.information << Information.find_by(name: "Type")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Kids")
item.information << Information.find_by(name: "Type")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Classic")
item.information << Information.find_by(name: "Type")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Mountain")
item.information << Information.find_by(name: "Type")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Road")
item.information << Information.find_by(name: "Type")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Hybrid")
item.information << Information.find_by(name: "Type")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Balance")
item.information << Information.find_by(name: "Type")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Electric")
item.information << Information.find_by(name: "Type")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Fixie")
item.information << Information.find_by(name: "Type")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Standard")
item.information << Information.find_by(name: "Breaks")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "V-brake")
item.information << Information.find_by(name: "Breaks")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Hidraulic")
item.information << Information.find_by(name: "Breaks")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Mechanic")
item.information << Information.find_by(name: "Breaks")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Aluminium")
item.information << Information.find_by(name: "Material")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Iron")
item.information << Information.find_by(name: "Material")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Carbon")
item.information << Information.find_by(name: "Material")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "Titanium")
item.information << Information.find_by(name: "Material")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "13\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "14\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "15\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "16\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "16.5\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "17\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "17.5\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "18\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "18.5\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "19\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "19.5\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "20\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "20.5\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "21\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "21.5\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "22\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "22.5\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "23\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "23.5\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "24\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "24.5\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "25\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "25.5\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "26\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "26.5\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "27\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "27.5\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save

item = Item.new(name: "28\"")
item.information << Information.find_by(name: "Size")
item.categories << Category.find_by(name: "Bicycles")
item.save


Option.create!(name: "3rd Row Seats")
Option.create!(name: "Backup Camera")
Option.create!(name: "Cruise Control")
Option.create!(name: "Keyless Entry")
Option.create!(name: "Power Locks")
Option.create!(name: "Power Windows")
Option.create!(name: "Steering Wheel Controls")
Option.create!(name: "Bluetooth(Hands-Free)")
Option.create!(name: "CD Player")
Option.create!(name: "DVD Player")
Option.create!(name: "Navigation")
Option.create!(name: "Portable Audio Connection")
Option.create!(name: "Premium Audio")
Option.create!(name: "Security System")
Option.create!(name: "Heated Seats")
Option.create!(name: "Leather Seats")
Option.create!(name: "Premium Wheels")
Option.create!(name: "Sunroof")
Option.create!(name: "Disability Equipped")
Option.create!(name: "Lift Kit")
Option.create!(name: "Trailer Hitch")
Option.create!(name: "Back Break")
Option.create!(name: "Hands Break") 
Option.create!(name: "Lights") 

# CategoryOption
c = Category.find_by(name: "Cars")
o = Option.find_by(name: "3rd Row Seats")
c.options <<  o
o = Option.find_by(name: "Backup Camera")
c.options <<  o
o = Option.find_by(name: "Cruise Control")
c.options <<  o
o = Option.find_by(name: "Keyless Entry")
c.options <<  o
o = Option.find_by(name: "Power Locks")
c.options <<  o
o = Option.find_by(name: "Power Windows")
c.options <<  o
o = Option.find_by(name: "Steering Wheel Controls")
c.options <<  o
o = Option.find_by(name: "Bluetooth(Hands-Free)")
c.options <<  o
o = Option.find_by(name: "CD Player")
c.options <<  o
o = Option.find_by(name: "DVD Player")
c.options <<  o
o = Option.find_by(name: "Navigation")
c.options <<  o
o = Option.find_by(name: "Portable Audio Connection")
c.options <<  o
o = Option.find_by(name: "Premium Audio")
c.options <<  o
o = Option.find_by(name: "Security System")
c.options <<  o
o = Option.find_by(name: "Heated Seats")
c.options <<  o
o = Option.find_by(name: "Leather Seats")
c.options <<  o
o = Option.find_by(name: "Sunroof")
c.options <<  o
o = Option.find_by(name: "Premium Wheels")
c.options <<  o
o = Option.find_by(name: "Disability Equipped")
c.options <<  o
o = Option.find_by(name: "Lift Kit")
c.options <<  o
o = Option.find_by(name: "Trailer Hitch")
c.options <<  o
c.save

c = Category.find_by(name: "Trucks")
o = Option.find_by(name: "Backup Camera")
c.options <<  o
o = Option.find_by(name: "Cruise Control")
c.options <<  o
o = Option.find_by(name: "Keyless Entry")
c.options <<  o
o = Option.find_by(name: "Power Locks")
c.options <<  o
o = Option.find_by(name: "Power Windows")
c.options <<  o
o = Option.find_by(name: "Steering Wheel Controls")
c.options <<  o
o = Option.find_by(name: "Bluetooth(Hands-Free)")
c.options <<  o
o = Option.find_by(name: "CD Player")
c.options <<  o
o = Option.find_by(name: "DVD Player")
c.options <<  o
o = Option.find_by(name: "Navigation")
c.options <<  o
o = Option.find_by(name: "Portable Audio Connection")
c.options <<  o
o = Option.find_by(name: "Premium Audio")
c.options <<  o
o = Option.find_by(name: "Security System")
c.options <<  o
o = Option.find_by(name: "Heated Seats")
c.options <<  o
o = Option.find_by(name: "Leather Seats")
c.options <<  o
o = Option.find_by(name: "Sunroof")
c.options <<  o
o = Option.find_by(name: "Premium Wheels")
c.options <<  o
o = Option.find_by(name: "Disability Equipped")
c.options <<  o
o = Option.find_by(name: "Lift Kit")
c.options <<  o
o = Option.find_by(name: "Trailer Hitch")
c.options <<  o
c.save

c = Category.find_by(name: "Bicycles")
o = Option.find_by(name: "Navigation")
c.options <<  o
o = Option.find_by(name: "Security System")
c.options <<  o
o = Option.find_by(name: "Heated Seats")
c.options <<  o
o = Option.find_by(name: "Leather Seats")
c.options <<  o
o = Option.find_by(name: "Premium Wheels")
c.options <<  o
o = Option.find_by(name: "Lights")
c.options <<  o
o = Option.find_by(name: "Back Break")
c.options <<  o
o = Option.find_by(name: "Hands Break")
c.options <<  o
c.save

ad1 = Advertisement.create!(
	title: "2010 BMW 530 D GT",
	description: "",
	price: 25.999, 
	year: DateTime.strptime("09/14/2009", "%m/%d/%Y"),
	active: true,
	category: Category.first,
	vehicle_model: VehicleModel.first,
	user: User.first,
	advertisement_type: AdvertisementType.first
)

AdvertisementInformation.create!(
	advertisement: ad1,
	information: Information.find_by(name: "Capacity"),
	value: "2000"
)

AdvertisementInformation.create!(
	advertisement: ad1,
	information: Information.find_by(name: "Power"),
	value: "2500"
)

AdvertisementInformation.create!(
	advertisement: ad1,
	information: Information.find_by(name: "Mileage"),
	value: "192.333"
)

AdvertisementInformation.create!(
	advertisement: ad1,
	information: Information.find_by(name: "Fuel"),
	value: "Diesel"
)

AdvertisementInformation.create!(
	advertisement: ad1,
	information: Information.find_by(name: "Drive"),
	value: "AWD"
)

AdvertisementInformation.create!(
	advertisement: ad1,
	information: Information.find_by(name: "Air Condition"),
	value: "Manual"
)

AdvertisementInformation.create!(
	advertisement: ad1,
	information: Information.find_by(name: "Style"),
	value: "Commercial"
)

AdvertisementInformation.create!(
	advertisement: ad1,
	information: Information.find_by(name: "Transmission"),
	value: "Automatic"
)

AdvertisementInformation.create!(
	advertisement: ad1,
	information: Information.find_by(name: "Exterior Color"),
	value: "Black"
)

AdvertisementInformation.create!(
	advertisement: ad1,
	information: Information.find_by(name: "Interior Color"),
	value: "White"
)

AdvertisementInformation.create!(
	advertisement: ad1,
	information: Information.find_by(name: "Engine"),
	value: "8 cylinder"
)

ad1.options << Option.find_by(name: "3rd Row Seats")
ad1.options << Option.find_by(name: "Backup Camera")
ad1.options << Option.find_by(name: "Power Locks")
ad1.options << Option.find_by(name: "Bluetooth(Hands-Free)")
ad1.options << Option.find_by(name: "CD Player")
ad1.options << Option.find_by(name: "DVD Player")
ad1.options << Option.find_by(name: "Navigation")
ad1.options << Option.find_by(name: "Premium Audio")
ad1.options << Option.find_by(name: "Security System")
ad1.options << Option.find_by(name: "Trailer Hitch")
ad1.save

ad2 = Advertisement.create!(
	title: "Mountain Bike Boardman",
	description: "",
	price: 500, 
	year: DateTime.strptime("12/12/2014", "%m/%d/%Y"),
	active: true,
	category: Category.find_by(name: "Bicycles"),
	vehicle_model: VehicleModel.find_by(name: "Boardman Mountain Bike Team 29er"),
	user: User.first,
	advertisement_type: AdvertisementType.first
)

AdvertisementInformation.create!(
	advertisement: ad2,
	information: Information.find_by(name: "Type"),
	value: "Mountain"
)

AdvertisementInformation.create!(
	advertisement: ad2,
	information: Information.find_by(name: "Size"),
	value: "28"
)

AdvertisementInformation.create!(
	advertisement: ad2,
	information: Information.find_by(name: "Material"),
	value: "Iron"
)

AdvertisementInformation.create!(
	advertisement: ad2,
	information: Information.find_by(name: "Breaks"),
	value: "Standard"
)

AdvertisementInformation.create!(
	advertisement: ad2,
	information: Information.find_by(name: "Color"),
	value: "Blue"
)

ad2.options << Option.find_by(name: "Back Break")
ad2.options << Option.find_by(name: "Hands Break")
ad2.options << Option.find_by(name: "Lights")
ad2.options << Option.find_by(name: "Navigation")
ad2.options << Option.find_by(name: "Security System")
ad2.options << Option.find_by(name: "Leather Seats")
ad2.save