class AddAdvertisementToComments < ActiveRecord::Migration
  def change
  	add_reference :comments, :advertisement, index: true, foreign_key: true
  end
end
