require 'rails_helper'

RSpec.describe Information, type: :model do
	it { should belong_to :information_type }
	it { should have_many :advertisement_informations }
	it { should have_many(:advertisements).through(:advertisement_informations) }
	it { should have_and_belong_to_many :items }
end