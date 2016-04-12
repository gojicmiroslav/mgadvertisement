FactoryGirl.define do

	factory :information_type do
		name "Information Type"
	end

	factory :basic_information_type, parent: :information_type do
		name "Basic"
	end

	factory :additional_information_type, parent: :information_type do
		name "Additional"
	end

end