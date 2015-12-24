class Color < ActiveRecord::Base

	has_many :exterior_colors, class_name: 'Advertisement', foreign_key: :exterior_color_id
	has_many :interior_colors, class_name: 'Advertisement', foreign_key: :exterior_color_id
	validates :name, presence: true
	
end
