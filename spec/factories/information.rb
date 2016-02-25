FactoryGirl.define do

	factory :information do
		name "Information"
		information_type 
	end

	factory :capacity, parent: :information do
		name "Capacity"
		information_type 
	end

end