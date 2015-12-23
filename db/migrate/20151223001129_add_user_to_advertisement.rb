class AddUserToAdvertisement < ActiveRecord::Migration
  def change
  	add_reference :advertisements, :user, index: true
  	add_foreign_key :advertisements, :users, on_delete: :cascade, on_update: :cascade
  end
end
