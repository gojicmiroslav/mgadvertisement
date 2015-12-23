class AddColorsToAdvertisement < ActiveRecord::Migration
  def change
  	add_reference :advertisements, :exterior_color, references: :colors, index: true
  	add_foreign_key :advertisements, :colors, column: :exterior_color_id , on_delete: :cascade, on_update: :cascade

  	add_reference :advertisements, :interior_color, references: :colors, index: true
  	add_foreign_key :advertisements, :colors, column: :interior_color_id , on_delete: :cascade, on_update: :cascade
  end
end
