require 'rails_helper'

RSpec.describe Fuel, type: :model do 

	context "validation" do

		before do
			@fuel = Fuel.new(name: "Test")
			@invalid_fuel_1 = Fuel.new(name: "")
			@invalid_fuel_2 = Fuel.new()
		end

		it "should be valid" do
			@fuel.valid?
			expect(@fuel.errors).to be_empty
			expect(@fuel.errors.count).to eq(0)
		end

		it "should be invalid with name equal empty string" do
			@invalid_fuel_1.valid?
			expect(@invalid_fuel_1.errors).not_to be_empty
			expect(@invalid_fuel_1.errors.count).not_to eq(0)
		end

		it "should be invalid with no name" do
			@invalid_fuel_2.valid?
			expect(@invalid_fuel_2.errors).not_to be_empty
			expect(@invalid_fuel_2.errors.count).not_to eq(0)
		end

		it { should validate_presence_of :name }
	end
	
	it { should have_many :advertisements }
end