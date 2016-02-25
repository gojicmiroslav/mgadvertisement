require 'rails_helper'

RSpec.describe Item, type: :model do
	it { should have_and_belong_to_many :information }
	it { should have_and_belong_to_many :categories }
end