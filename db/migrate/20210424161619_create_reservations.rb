class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.date :start_day
      t.date :end_day
      t.integer :person
      t.integer :cost

      t.timestamps
    end
  end
end
