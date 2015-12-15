require 'rails_helper'

RSpec.describe Style, type: :model do
	
	context "validation" do

		before do
			@style = Style.new(name: "Test")
			@invalid_style_1 = Style.new(name: "")
			@invalid_style_2 = Style.new()
		end

		it "should be valid" do
			@style.valid?
			expect(@style.errors).to be_empty
			expect(@style.errors.count).to eq(0)
		end

		it "should be invalid with name equal empty string" do
			@invalid_style_1.valid?
			expect(@invalid_style_1.errors).not_to be_empty
			expect(@invalid_style_1.errors.count).not_to eq(0)
		end

		it "should be invalid with no name" do
			@invalid_style_2.valid?
			expect(@invalid_style_2.errors).not_to be_empty
			expect(@invalid_style_2.errors.count).not_to eq(0)
		end

		it { should validate_presence_of :name }
	end

end