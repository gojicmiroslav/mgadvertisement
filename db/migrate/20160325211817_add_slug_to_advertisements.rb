class AddSlugToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :slug, :string
    add_index :advertisements, :slug, unique: true
  end
end
