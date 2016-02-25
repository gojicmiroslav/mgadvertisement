FactoryGirl.define do

	factory :information_type do
		name "Information Type"
	end

	factory :basic, parent: :information_type do
		name "Basic"
	end

	factory :additional, parent: :information_type do
		name "Additional"
	end

end