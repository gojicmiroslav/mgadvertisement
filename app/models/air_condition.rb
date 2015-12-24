class AirCondition < ActiveRecord::Base
	has_many :advertisements

	validates :name, presence: true
	
end
