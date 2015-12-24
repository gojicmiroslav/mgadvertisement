class Advertisement < ActiveRecord::Base

	belongs_to :engine
	belongs_to :fuel
	belongs_to :drive
	belongs_to :transmission
	belongs_to :style
	belongs_to :advertisement_type
	belongs_to :user
	belongs_to :category
	belongs_to :vehicle_model
	belongs_to :air_condition
	has_and_belongs_to_many :options
	belongs_to :exterior_color, class_name: "Color"
	belongs_to :interior_color, class_name: "Color"

	validates :title, presence: true
end
