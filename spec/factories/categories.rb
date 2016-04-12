FactoryGirl.define do
	
	factory :category do
		name "Text Category 1"
		description "Test category Description"
		information
	end

	factory :cars, parent: :category do
		name "Cars"
		description "Cars category Description"
	end

	factory :trucks, parent: :category do
		name "Trucks"
		description "Trucks category Description"
	end

	factory :bicycles, parent: :category do
		name "Bicycles"
		description "Cars category Description"
	end

end