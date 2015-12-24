class Engine < ActiveRecord::Base
	has_many :advertisements

	validates :name, presence: true

end
