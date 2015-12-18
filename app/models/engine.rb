class Engine < ActiveRecord::Base

	validates :name, presence: true

end
