class CreateVehicleBrands < ActiveRecord::Migration
  def change
    create_table :vehicle_brands do |t|
      t.string :name, unique: true

      t.timestamps null: false
    end
  end
end
