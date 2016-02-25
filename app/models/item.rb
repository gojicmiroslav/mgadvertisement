class Item < ActiveRecord::Base
	has_and_belongs_to_many :information
	has_and_belongs_to_many :categories

end
