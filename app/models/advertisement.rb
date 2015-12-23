class Advertisement < ActiveRecord::Base

	#belongs_to :exterior_color, class_name: "Color"
	#belongs_to :interior_color, class_name: "Color"

	validates :title, presence: true
end
