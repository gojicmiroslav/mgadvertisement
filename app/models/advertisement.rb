class Advertisement < ActiveRecord::Base

	validates :title, presence: true
end
