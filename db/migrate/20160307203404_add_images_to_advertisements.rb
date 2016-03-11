class AddImagesToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :images, :text, array: true
  end
end
