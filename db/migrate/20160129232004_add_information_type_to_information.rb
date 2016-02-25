class AddInformationTypeToInformation < ActiveRecord::Migration
  def change
  	add_reference :information, :information_type, index: true
  	add_foreign_key :information, :information_types, on_delete: :cascade, on_update: :cascade
  end
end
