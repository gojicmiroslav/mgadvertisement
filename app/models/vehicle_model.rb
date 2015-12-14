class VehicleModel < ActiveRecord::Base
	belongs_to :vehicle_brand
	belongs_to :category

	accepts_nested_attributes_for :category
	accepts_nested_attributes_for :vehicle_brand

	validates :name, presence: true
end
