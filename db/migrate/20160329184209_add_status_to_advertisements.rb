class AddStatusToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :status, :integer
  end
end
