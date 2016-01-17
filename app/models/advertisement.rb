class Advertisement < ActiveRecord::Base

	belongs_to :engine, validate: true
	belongs_to :fuel, validate: true
	belongs_to :drive, validate: true
	belongs_to :transmission, validate: true
	belongs_to :style, validate: true
	belongs_to :advertisement_type
	belongs_to :user, validate: true
	belongs_to :category, validate: true
	belongs_to :vehicle_model, validate: true
	belongs_to :air_condition, validate: true
	has_and_belongs_to_many :options
	belongs_to :exterior_color, class_name: "Color", validate: true
	belongs_to :interior_color, class_name: "Color", validate: true

	validates :title, presence: true
	validates :price, presence: true
	validates :year, presence: true
	validates :capacity, presence: true
	validates :power, presence: true
	validates :mileage, presence: true
	validates :fuel, presence: true
	validates :style, presence: true
	validates :air_condition, presence: true
	validates :exterior_color, presence: true
	validates :interior_color, presence: true
	validates :engine, presence: true
	validates :drive, presence: true
	validates :transmission, presence: true
	validates :vehicle_model, presence: true
	validates :user, presence: true
end
