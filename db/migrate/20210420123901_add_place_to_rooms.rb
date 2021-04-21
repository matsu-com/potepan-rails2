class AddPlaceToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :place, :string
  end
end
