require 'rails_helper'

RSpec.describe VehicleModel, type: :model do 

	context "validation" do

		before do
			@vehicle_model = VehicleModel.new(name: "Test Model")
			@invalid_vehicle_model = VehicleModel.new(name: "")
			@another_invalid_vehicle_model = VehicleModel.new()
		end

		it "should be valid" do
			@vehicle_model.valid?
			expect(@vehicle_model.errors.size).to eq(0)
		end

		it "should be invalid with name equal empty string" do
			@invalid_vehicle_model.valid?
			expect(@invalid_vehicle_model.errors.size).not_to eq(0)
		end

		it "should be invalid with no name" do
			@another_invalid_vehicle_model.valid?
			expect(@another_invalid_vehicle_model.errors.size).not_to eq(0)
		end
		
		it{ should validate_presence_of :name }
	end
	
	it { should belong_to :vehicle_brand }
	it { should belong_to :category }
end