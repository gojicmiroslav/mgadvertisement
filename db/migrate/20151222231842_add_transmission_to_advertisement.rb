class AddTransmissionToAdvertisement < ActiveRecord::Migration
  def change
  	add_reference :advertisements, :transmission, index: true
  	add_foreign_key :advertisements, :transmissions, on_delete: :cascade, on_update: :cascade
  end
end
