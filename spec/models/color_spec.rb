require 'rails_helper'

RSpec.describe Color, type: :model do 

	context "validation" do

		before do
			@color = Color.new(name: "Test")
			@invalid_color_1 = Color.new(name: "")
			@invalid_color_2 = Color.new()
		end

		it "should be valid" do
			@color.valid?
			expect(@color.errors).to be_empty
			expect(@color.errors.count).to eq(0)
		end

		it "should be invalid with name equal empty string" do
			@invalid_color_1.valid?
			expect(@invalid_color_1.errors).not_to be_empty
			expect(@invalid_color_1.errors.count).not_to eq(0)
		end

		it "should be invalid with no name" do
			@invalid_color_2.valid?
			expect(@invalid_color_2.errors).not_to be_empty
			expect(@invalid_color_2.errors.count).not_to eq(0)
		end

		it { should validate_presence_of :name }
	end
	
end