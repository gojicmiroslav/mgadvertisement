require 'rails_helper'

RSpec.describe Category, type: :model do
	
	context "validation" do
		before do
			@category = Category.new(name: "Text Category", description: "Test Description of Category")		
			@invalid_category = Category.new(name: "", description: "Test Description of Category")
			@another_invalid_category = Category.new(description: "Test Description of Category")
		end

		it "should be valid" do
			@category.valid?
			expect(@category.errors.size).to eq(0)
		end

		it "should be invalid with name equal empty string" do
			@invalid_category.valid?
			expect(@invalid_category.errors.size).not_to eq(0)
		end

		it "should be invalid with no name" do
			@another_invalid_category.valid?
			expect(@another_invalid_category.errors.size).not_to eq(0)
		end

		it{ should validate_presence_of :name }
	end

	it{ should have_and_belong_to_many :vehicle_brands }

end