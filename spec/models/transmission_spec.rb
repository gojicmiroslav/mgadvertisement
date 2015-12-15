require 'rails_helper'

RSpec.describe Transmission, type: :model do 

	context "validation" do

		before do
			@transmission = Transmission.new(name: "Test")
			@invalid_transmission_1 = Transmission.new(name: "")
			@invalid_transmission_2 = Transmission.new()
		end

		it "should be valid" do
			@transmission.valid?
			expect(@transmission.errors).to be_empty
			expect(@transmission.errors.count).to eq(0)
		end

		it "should be invalid with name equal empty string" do
			@invalid_transmission_1.valid?
			expect(@invalid_transmission_1.errors).not_to be_empty
			expect(@invalid_transmission_1.errors.count).not_to eq(0)
		end

		it "should be invalid with no name" do
			@invalid_transmission_2.valid?
			expect(@invalid_transmission_2.errors).not_to be_empty
			expect(@invalid_transmission_2.errors.count).not_to eq(0)
		end

		it { should validate_presence_of :name }
	end
	
end