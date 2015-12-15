class Drive < ActiveRecord::Base
	validates :name, presence: true
end
