class VehicleBrand < ActiveRecord::Base
	has_and_belongs_to_many :categories
	accepts_nested_attributes_for :categories

	validates :name, presence: true
end
