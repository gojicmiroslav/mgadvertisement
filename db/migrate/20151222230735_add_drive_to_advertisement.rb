class AddDriveToAdvertisement < ActiveRecord::Migration
  def change
  	add_reference :advertisements, :drive, index: true
  	add_foreign_key :advertisements, :drives, column: :drive_id, on_delete: :cascade, on_update: :cascade
  end
end
