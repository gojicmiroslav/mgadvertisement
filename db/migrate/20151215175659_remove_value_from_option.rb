class RemoveValueFromOption < ActiveRecord::Migration
  def change
  	remove_column :options, :value
  end
end
