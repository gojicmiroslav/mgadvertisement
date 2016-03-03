class CreateAdvertisementInformations < ActiveRecord::Migration
  def change
  	create_table :advertisement_information do |t|
  		t.string :value
  		t.references :advertisement, index: true
  		t.references :information, index: true

      t.timestamps null: false
  	end

  	#add_index :advertisement_informations, ["advertisement_id", "information_id"]
  	add_foreign_key :advertisement_information, :advertisements
  	add_foreign_key :advertisement_information, :information
  end
end
