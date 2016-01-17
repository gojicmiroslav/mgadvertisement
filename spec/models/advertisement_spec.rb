require "rails_helper"

RSpec.describe Advertisement, type: :model do

	context "validation" do
		it{ should validate_presence_of :title }
		it{ should validate_presence_of :price }
		it{ should validate_presence_of :year }
		it{ should validate_presence_of :capacity }
		it{ should validate_presence_of :power }
		it{ should validate_presence_of :mileage }
		it{ should validate_presence_of :fuel }
		it{ should validate_presence_of :style }
		it{ should validate_presence_of :air_condition }
		it{ should validate_presence_of :exterior_color }
		it{ should validate_presence_of :interior_color }
		it{ should validate_presence_of :engine }
		it{ should validate_presence_of :drive }
		it{ should validate_presence_of :transmission }
		it{ should validate_presence_of :vehicle_model }
		it{ should validate_presence_of :user }
	end

	it { should belong_to(:engine).validate(true) }
	it { should belong_to(:fuel).validate(true) }
	it { should belong_to(:drive).validate(true) }
	it { should belong_to(:style).validate(true) }
	it { should belong_to(:air_condition).validate(true) }
	it { should belong_to(:transmission).validate(true) }
	it { should belong_to(:user).validate(true) }
	it { should belong_to(:category).validate(true) }
	it { should belong_to(:vehicle_model).validate(true) }
	it { should belong_to :advertisement_type }
	it { should have_and_belong_to_many :options }
	it { should belong_to(:exterior_color).class_name('Color').validate(true)  }
	it { should belong_to(:interior_color).class_name('Color').validate(true)  }
end