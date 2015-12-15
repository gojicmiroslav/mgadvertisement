require 'rails_helper'

RSpec.describe Drive, type: :model do 

	context "validation" do

		before do
			@drive = Drive.new(name: "Test")
			@invalid_drive_1 = Drive.new(name: "")
			@invalid_drive_2 = Drive.new()
		end

		it "should be valid" do
			@drive.valid?
			expect(@drive.errors).to be_empty
			expect(@drive.errors.count).to eq(0)
		end

		it "should be invalid with name equal empty string" do
			@invalid_drive_1.valid?
			expect(@invalid_drive_1.errors).not_to be_empty
			expect(@invalid_drive_1.errors.count).not_to eq(0)
		end

		it "should be invalid with no name" do
			@invalid_drive_2.valid?
			expect(@invalid_drive_2.errors).not_to be_empty
			expect(@invalid_drive_2.errors.count).not_to eq(0)
		end

		it { should validate_presence_of :name }
	end
	
end