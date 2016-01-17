class Option < ActiveRecord::Base
	has_and_belongs_to_many :advertisements
	has_and_belongs_to_many :categories

	validates :name, presence: true
end
