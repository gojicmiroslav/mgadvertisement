class CreateAirConditions < ActiveRecord::Migration
  def change
    create_table :air_conditions do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
