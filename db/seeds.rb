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
vb = VehicleBrand.create!(name: "Access Motor")
vb.categories << Category.find_by(name: "Bicycles")
vb.save

vb = VehicleBrand.create!(name: "Adly")
vb.categories << Category.find_by(name: "Bicycles")
vb.save

vb = VehicleBrand.create!(name: "Aeon")
vb.categories << Category.find_by(name: "Bicycles")
vb.save

vb = VehicleBrand.create!(name: "AJS")
vb.categories << Category.find_by(name: "Bicycles")
vb.save

vb = VehicleBrand.find_by(name: "BMW")
vb.categories << Category.find_by(name: "Bicycles")
vb.save

vb = VehicleBrand.find_by(name: "Renault")
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

vm = VehicleModel.new(name: "Byc 1")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Access Motor")
vm.save

vm = VehicleModel.new(name: "Byc 2")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Access Motor")
vm.save

vm = VehicleModel.new(name: "Byc 3")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Access Motor")
vm.save

vm = VehicleModel.new(name: "Byc 4")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Access Motor")
vm.save

vm = VehicleModel.new(name: "Byc 5")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Access Motor")
vm.save

vm = VehicleModel.new(name: "Renault Byc 1")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Renault")
vm.save

vm = VehicleModel.new(name: "Renault Byc 2")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Renault")
vm.save

vm = VehicleModel.new(name: "Renault Byc 3")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Renault")
vm.save

vm = VehicleModel.new(name: "Renault Byc 4")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand  VehicleBrand.find_by(name: "Renault")
vm.save

# ADVERTISEMENT TYPE
AdvertisementType.create!(name: "New")
AdvertisementType.create!(name: "Used")

# OPTIONS

# STYLES
Style.create!(new: "AWD/4WD")
Style.create!(new: "Commercial")
Style.create!(new: "Convertible")
Style.create!(new: "Coupe")
Style.create!(new: "Hatchback")
Style.create!(new: "Hybrid/Electric")
Style.create!(new: "Luxury")
Style.create!(new: "Sedan")
Style.create!(new: "SUV/Crossover")
Style.create!(new: "Truck")
Style.create!(new: "Van/Minivan")
Style.create!(new: "Wagon")

Fuel.create!(name: "Gasoline")
Fuel.create!(name: "Diesel")
Fuel.create!(name: "Gasoline + Gas(TNG)")
Fuel.create!(name: "Hybrid")
Fuel.create!(name: "Electric")
Fuel.create!(name: "Alternate")

Transmission.create!(name: "Automatic")
Transmission.create!(name: "Manual")
Transmission.create!(name: "Semi-automatic")
Transmission.create!(name: "CVT")
Transmission.create!(name: "Other")

Drive.create!(name: "FWD")
Drive.create!(name: "RWD")
Drive.create!(name: "AWD")
Drive.create!(name: "4WD")
Drive.create!(name: "4x4")
Drive.create!(name: "4x2")
Drive.create!(name: "Other")