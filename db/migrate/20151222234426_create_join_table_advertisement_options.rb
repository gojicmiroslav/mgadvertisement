class CreateJoinTableAdvertisementOptions < ActiveRecord::Migration
  def change
  	create_table :advertisements_options, id: false do |t|
  		t.references :advertisement, null: false, index: true
  		t.references :option, null: false, index: true
  	end

  	add_foreign_key :advertisements_options, :advertisements
    add_foreign_key :advertisements_options, :options
  end
end
