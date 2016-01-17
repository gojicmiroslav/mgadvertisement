class CreateJoinTableCategoryOptions < ActiveRecord::Migration
  def change
  	create_table :categories_options, id: false do |t|
  		t.references :category, null: false, index: true
  		t.references :option,   null: false, index: true
  	end

  	add_foreign_key :categories_options, :categories
    add_foreign_key :categories_options, :options
  end
end
