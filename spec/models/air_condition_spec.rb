require 'rails_helper'

RSpec.describe AirCondition, type: :model do 

	context "validation" do

		before do
			@air_condition = AirCondition.new(name: "Test")
			@invalid_air_condition_1 = AirCondition.new(name: "")
			@invalid_air_condition_2 = AirCondition.new()
		end

		it "should be valid" do
			@air_condition.valid?
			expect(@air_condition.errors).to be_empty
			expect(@air_condition.errors.count).to eq(0)
		end

		it "should be invalid with name equal empty string" do
			@invalid_air_condition_1.valid?
			expect(@invalid_air_condition_1.errors).not_to be_empty
			expect(@invalid_air_condition_1.errors.count).not_to eq(0)
		end

		it "should be invalid with no name" do
			@invalid_air_condition_2.valid?
			expect(@invalid_air_condition_2.errors).not_to be_empty
			expect(@invalid_air_condition_2.errors.count).not_to eq(0)
		end

		it { should validate_presence_of :name }
	end
	
end