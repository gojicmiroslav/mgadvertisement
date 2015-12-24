require 'rails_helper'

RSpec.describe Engine, type: :model do
	
	context "validation" do

		before do
			@engine = Engine.new(name: "Test")
			@invalid_engine_1 = Engine.new(name: "")
			@invalid_engine_2 = Engine.new()
		end

		it "should be valid" do
			@engine.valid?
			expect(@engine.errors).to be_empty
			expect(@engine.errors.count).to eq(0)
		end

		it "should be invalid with name equal empty string" do
			@invalid_engine_1.valid?
			expect(@invalid_engine_1.errors).not_to be_empty
			expect(@invalid_engine_1.errors.count).not_to eq(0)
		end

		it "should be invalid with no name" do
			@invalid_engine_2.valid?
			expect(@invalid_engine_2.errors).not_to be_empty
			expect(@invalid_engine_2.errors.count).not_to eq(0)
		end

		it { should validate_presence_of :name }
	end

	it { should have_many :advertisements }
end