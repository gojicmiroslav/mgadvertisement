class RemoveActiveFromAdvertisement < ActiveRecord::Migration
  def change
    remove_column :advertisements, :active
  end
end
