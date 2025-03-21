class AddRestaurantToGalleries < ActiveRecord::Migration[8.0]
  def change
    add_reference :galleries, :restaurant, null: false, foreign_key: true
  end
end
