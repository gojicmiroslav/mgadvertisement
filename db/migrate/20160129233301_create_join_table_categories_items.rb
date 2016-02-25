class CreateJoinTableCategoriesItems < ActiveRecord::Migration
  def change
  	create_table :categories_items, id: false do |t|
			t.references :category, null: false, index: true
  		t.references :item, null: false, index: true
  	end

  	add_foreign_key :categories_items, :categories
  	add_foreign_key :categories_items, :items
  end
end
