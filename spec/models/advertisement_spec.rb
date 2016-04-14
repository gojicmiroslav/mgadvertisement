require "rails_helper"

RSpec.describe Advertisement, type: :model do

	context "validation" do
  	it{ should validate_presence_of :title }
		it{ should validate_presence_of :price }
		it{ should validate_presence_of :year }
		it{ should validate_presence_of :vehicle_model }
		it{ should validate_presence_of :user }
	end

	it { should belong_to(:user).validate(true) }
	it { should belong_to(:category).validate(true) }
	it { should belong_to(:vehicle_model).validate(true) }
	it { should belong_to :advertisement_type }
	it { should have_and_belong_to_many :options }
	it { should have_many :advertisement_informations }
	it { should have_many(:informations).through(:advertisement_informations) }
	it { should have_many :comments }
	
	#it { should belong_to(:exterior_color).class_name('Color').validate(true)  }
	#it { should belong_to(:interior_color).class_name('Color').validate(true)  }

end