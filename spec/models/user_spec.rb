require 'rails_helper'

RSpec.describe User, type: :model do
	
	context "validation" do
		before do
  		@user = User.new(firstname: "Example", lastname: "User" ,email: "user@example.com",
  										 password: "foobar123", password_confirmation: "foobar123")
  	end

  	it "should be valid" do
	  	@user.valid?
	  	expect(@user.errors.size).to eq(0)
	  end

		it { should validate_presence_of :firstname }
		it { should validate_presence_of :lastname }
		it { should validate_length_of(:firstname).is_at_most(100) }
		it { should validate_length_of(:lastname).is_at_most(100) }
		it { should validate_uniqueness_of(:email).case_insensitive }
	  it { should validate_length_of(:password).is_at_least(8) }

	  it "accept valid email address" do
			valid_addresses = %w[ user@example.com USER@foo.COM A_US_ER@foo.bar.org 
														first.last@foo.jp alice+bob@baz.cn]
			valid_addresses.each do |valid_address|
				user = User.new(firstname: 'Example', lastname: "User" ,email: valid_address,
												password: "foobar123", password_confirmation: "foobar123")
  			user.save
				expect(user.errors.get(:email)).to be_nil
			end										
		end
	end
end