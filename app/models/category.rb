class Category < ActiveRecord::Base
  extend FriendlyId

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

  friendly_id :name, use: [:slugged, :finders]

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

  def search_options
    if name.eql?("Cars")
      search_options = [
        { title: "Fuel", select_name: "fuel", items_name: "Fuel"},
        { title: "Engine", select_name: "engine", items_name: "Engine" },
        { title: "Drive",  select_name: "drive", items_name: "Drive" },
        { title: "Air Condition", select_name: "air_condition", items_name: "Air Condition" },
        { title: "Transmission", select_name: "transmission", items_name: "Transmission" },
        { title: "Exterior Color", select_name: "exterior_color", items_name: "Exterior Color" }
      ]
    elsif name.eql?("Bicycles")
      search_options = [
        { title: "Type", select_name: "type", items_name: "Type"},
        { title: "Color", select_name: "color", items_name: "Color" },
        { title: "Material",  select_name: "material", items_name: "Material" },
        { title: "Size", select_name: "size", items_name: "Size" },
        { title: "Breaks", select_name: "breaks", items_name: "Breaks" }
      ]
    elsif name.eql?("Trucks")
      search_options = [
        { title: "Fuel", select_name: "fuel", items_name: "Fuel"},
        { title: "Engine", select_name: "engine", items_name: "Engine" },
        { title: "Drive",  select_name: "drive", items_name: "Drive" },
        { title: "Air Condition", select_name: "air_condition", items_name: "Air Condition" },
        { title: "Transmission", select_name: "transmission", items_name: "Transmission" },
        { title: "Exterior Color", select_name: "exterior_color", items_name: "Exterior Color" }
      ]
    else
      search_options = []  
    end
  end

  def slug_candidates
    [
      :name,
      [:id, :name]
    ]
  end

end
