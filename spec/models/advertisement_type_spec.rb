require 'rails_helper'

RSpec.describe AdvertisementType, type: :model do 

	context "validation" do

		before do 
			@advertisement_type = AdvertisementType.new(name: "Test", description: "Test")
			@invalid_advertisement_type = AdvertisementType.new(name: "", description: "")
			@another_invalid_advertisement_type = AdvertisementType.new()
		end	
		
		it "should be valid" do
			@advertisement_type.valid?
			expect(@advertisement_type.errors).to be_empty
			expect(@advertisement_type.errors.size).to eq(0)
		end

		it "should be invalid with name equal empty string" do
			@invalid_advertisement_type.valid?
			expect(@invalid_advertisement_type.errors).not_to be_empty
			expect(@invalid_advertisement_type.errors.size).not_to eq(0)
		end

		it "should be invalid with no name" do
			@another_invalid_advertisement_type.valid?
			expect(@another_invalid_advertisement_type.errors).not_to be_empty
			expect(@another_invalid_advertisement_type.errors.size).not_to eq(0)
		end

		it { should validate_presence_of :name }
	end

	it { should have_many :advertisements }
end