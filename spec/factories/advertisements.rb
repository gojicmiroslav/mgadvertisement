FactoryGirl.define do

	factory :advertisement do
		sequence(:title){ |n| "Advertisement text title #{n}"}
		price 10000
		year { Time.now }
		user
		category
		vehicle_model
		associations :informations
	end

end