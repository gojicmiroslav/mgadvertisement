class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
