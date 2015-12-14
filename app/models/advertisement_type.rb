class AdvertisementType < ActiveRecord::Base

	validates :name, presence: true
end
