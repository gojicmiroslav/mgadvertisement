require "rails_helper"

RSpec.describe Advertisement, type: :model do

	context "validation" do

		before do
			@advertisement = Advertisement.new(title: "Valid Name", description: "Valid Value")
			@invalid_advertisement_1 = Advertisement.new(title: "", description: "")
			@invalid_advertisement_2 = Advertisement.new()
		end

		it "should be valid" do
			@advertisement.valid?
			expect(@advertisement.errors).to be_empty
			expect(@advertisement.errors.size).to eq(0)
		end

		it "should be invalid with name equal empty string" do
			@invalid_advertisement_1.valid?
			expect(@invalid_advertisement_1.errors).not_to be_empty
			expect(@invalid_advertisement_1.errors.size).not_to eq(0)
		end

		it "should be invalid with no name and value" do
			@invalid_advertisement_2.valid?
			expect(@invalid_advertisement_2.errors).not_to be_empty
			expect(@invalid_advertisement_2.errors.size).not_to eq(0)
		end

		it{ should validate_presence_of :title }
	end

	
end