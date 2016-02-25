class CreateJoinTableInformationItems < ActiveRecord::Migration
  def change
  	create_table :information_items, id: false do |t|
  		t.references :information, null: false, index: true
  		t.references :item, null: false, index: true
  	end

  	add_foreign_key :information_items, :information
  	add_foreign_key :information_items, :items
  end
end
