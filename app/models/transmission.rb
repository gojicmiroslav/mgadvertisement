class Transmission < ActiveRecord::Base
	validates :name, presence: true
end
