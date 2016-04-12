FactoryGirl.define do

	factory :information do
		name "Information"
		information_type 
	end

	factory :capacity, parent: :information do
		name "Capacity"
		information_type basic_information_type
	end

	factory :power, parent: :information do
		name "Power"
		information_type basic_information_type
	end

	factory :mileage, parent: :information do
		name "Mileage"
		information_type basic_information_type
	end

end