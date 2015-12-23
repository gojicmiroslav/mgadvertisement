class AddAdvertisementTypeToAdvertisement < ActiveRecord::Migration
  def change
  	add_reference :advertisements, :advertisement_type, index: true
  	add_foreign_key :advertisements, :advertisement_types, on_delete: :cascade, on_update: :cascade
  end
end
