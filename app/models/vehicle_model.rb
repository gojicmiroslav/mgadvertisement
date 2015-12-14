class VehicleModel < ActiveRecord::Base
	belongs_to :vehicle_brand
	belongs_to :category
	validates :name, presence: true
end
