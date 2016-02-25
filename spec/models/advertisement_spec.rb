require "rails_helper"

RSpec.describe Advertisement, type: :model do

	context "validation" do
  	it{ should validate_presence_of :title }
		it{ should validate_presence_of :price }
		it{ should validate_presence_of :year }
		it{ should validate_presence_of :active }
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
	
	#it { should belong_to(:exterior_color).class_name('Color').validate(true)  }
	#it { should belong_to(:interior_color).class_name('Color').validate(true)  }

  context "testing save all method" do
  	before do
  		@category = FactoryGirl.create(:category)
			@vehicle_model = FactoryGirl.create(:vehicle_model)
			@user = FactoryGirl.create(:user)
			@information = FactoryGirl.create(:information)
			@capacity = FactoryGirl.create(:capacity)
  	end

  	let(:adv1) do
  		Advertisement.create!(
				title: "2010 BMW 530 D GT",
				description: "",
				price: 25.999, 
				year: DateTime.strptime("09/14/2009", "%m/%d/%Y"),
				active: true,
				category: @category,
				vehicle_model: @vehicle_model,
				user: @user,
				advertisement_type: nil
			)
  	end

  	let(:adv2){ Advertisement.new }

		it "should save all return true" do
			advertisement_informations = { @information.id => @information.name, @capacity.id => @capacity.name }
			expect(adv1.save_all(advertisement_informations)).to be true
		end

		it "should save all return false and destroy self" do
			advertisement_informations = { 0 => "", 0 => "" }
			expect(adv1.save_all(advertisement_informations)).to be false
		end

		it "should return false with invalid advertisement" do
			advertisement_informations = { @information.id => @information.name, @capacity.id => @capacity.name }
			expect(adv2.save_all(advertisement_informations)).to be false
		end

	end

end