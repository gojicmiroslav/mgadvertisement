require 'rails_helper'

RSpec.describe AdvertisementInformation, type: :model do
	it { should belong_to :information }
	it { should belong_to :advertisement }
end