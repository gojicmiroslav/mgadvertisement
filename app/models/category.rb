class Category < ActiveRecord::Base
	has_and_belongs_to_many :vehicle_brands
	has_and_belongs_to_many :options
  has_and_belongs_to_many :items
  has_and_belongs_to_many :information
  has_many :vehicle_models
	has_many :advertisements

	accepts_nested_attributes_for :vehicle_brands
	accepts_nested_attributes_for :options
	accepts_nested_attributes_for :items
	accepts_nested_attributes_for :information

	validates :name, presence: true

  def self.get_all_category_informations(category_id, type)
    if category_id == nil or type == nil
      return nil
    end

    id = InformationType.find_by(name: type).id
    category = Category.find(category_id)
    informations = []

    category.information.each do |info|
      if info.information_type_id == id
        informations << info
      end
    end

    return informations
  end

end
