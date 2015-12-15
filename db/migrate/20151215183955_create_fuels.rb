class CreateFuels < ActiveRecord::Migration
  def change
    create_table :fuels do |t|
    	t.string :name
    	
      t.timestamps null: false
    end
  end
end
