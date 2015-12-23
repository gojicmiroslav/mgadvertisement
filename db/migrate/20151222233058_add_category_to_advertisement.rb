class AddCategoryToAdvertisement < ActiveRecord::Migration
  def change
  	add_reference :advertisements, :category, index: true
  	add_foreign_key :advertisements, :categories, on_delete: :cascade, on_update: :cascade
  end
end
