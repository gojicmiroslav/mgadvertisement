class Category < ActiveRecord::Base
	has_and_belongs_to_many :vehicle_brands
	has_many :vehicle_models

	accepts_nested_attributes_for :vehicle_brands

	validates :name, presence: true

end
