class CreateJoinTableCategoriesInformation < ActiveRecord::Migration
  def change
  	create_table :categories_information, id: false do |t|
  		t.references :category, null: false, index: true
  		t.references :information, null: false, index: true
  	end

  	add_foreign_key :categories_information, :categories
  	add_foreign_key :categories_information, :information
  end
end
