require "rails_helper"

RSpec.describe Option, type: :model do

	context "validation" do

		before do
			@option = Option.new(name: "Valid Name")
			@invalid_option_1 = Option.new(name: "")
			@invalid_option_2 = Option.new()
		end

		it "should be valid" do
			@option.valid?
			expect(@option.errors).to be_empty
			expect(@option.errors.size).to eq(0)
		end

		it "should be invalid with name equal empty string" do
			@invalid_option_1.valid?
			expect(@invalid_option_1.errors).not_to be_empty
			expect(@invalid_option_1.errors.size).not_to eq(0)
		end

		it "should be invalid with no name" do
			@invalid_option_2.valid?
			expect(@invalid_option_2.errors).not_to be_empty
			expect(@invalid_option_2.errors.size).not_to eq(0)
		end

		it{ should validate_presence_of :name }
	end

	it { should have_and_belong_to_many :advertisements }
	it { should have_and_belong_to_many :categories }
end