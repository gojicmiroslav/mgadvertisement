require 'rails_helper'

RSpec.describe VehicleBrand, type: :model do
	
	context "validation" do
		
		before do 
			@vehicle_brand = VehicleBrand.new(name: "Test")
			@invalid_vehicle_brand = VehicleBrand.new(name: "")
			@another_invalid_vehicle_brand = VehicleBrand.new()
		end	

		it "should be valid" do
			@vehicle_brand.valid?
			expect(@vehicle_brand.errors).to be_empty
			expect(@vehicle_brand.errors.size).to eq(0)
		end

		it "should be invalid with name equal empty string" do
			@invalid_vehicle_brand.valid?
			expect(@invalid_vehicle_brand.errors.size).not_to eq(0)
		end

		it "should be invalid with no name" do
			@another_invalid_vehicle_brand.valid?
			expect(@another_invalid_vehicle_brand.errors.size).not_to eq(0)
		end

		it{ should validate_presence_of :name }
	end

	it{ should have_and_belong_to_many :categories }
	it { have_many :vehicle_models }
end