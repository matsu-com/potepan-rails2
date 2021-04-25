class AddCostTorooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :cost, :integer
  end
end
