FactoryGirl.define do
	
	factory :category do
		name "Text Category 1"
		description "Test category Description"
	end

	factory :category_2, parent: :category do
		name "Text Category 2"
		description "Test category Description"
	end

	factory :category_3, parent: :category do
		name "Text Category 3"
		description "Test category Description"
	end

	factory :category_4, parent: :category do
		name "Text Category 4"
		description "Test category Description"
	end

end