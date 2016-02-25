class Information < ActiveRecord::Base
	belongs_to :information_type
	has_and_belongs_to_many :categories
	has_many :information_options
	has_many :advertisement_informations
	has_many :advertisements, through: :advertisement_informations
	has_and_belongs_to_many :items

	accepts_nested_attributes_for :categories 

	def is_basic
		return information_type.name.eql?("Basic")
	end

	def is_additional
		return information_type.name.eql?("Additional")
	end

	def find_advertisement_information_value
		advertisement_information = advertisement_informations.find_by(information_id: id)

		if advertisement_information.nil?
			return nil
		end

		return advertisement_information.value
	end

	def get_advertisement_information_item 
		advertisement = advertisement_informations.find_by(information_id: id)

		if advertisement.nil? 
			return nil; 
		end

		ret_val = 0
		items.ids.each do |id|
			item = Item.find(id)
			if item.name == advertisement.value
				ret_val =  id
				break
			end
		end

		return ret_val
	end

end
