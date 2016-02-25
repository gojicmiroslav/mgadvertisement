class CreateInformationTypes < ActiveRecord::Migration
  def change
    create_table :information_types do |t|
    	t.string :name, null: false

    	t.timestamps null: false
    end
  end
end
