class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  with_options presence: true do
    validates :start_day
    validates :end_day
    validates :person
    validates :cost
  end
end
