class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  attachment :image

  def self.search(search)
    if search
      Room.where(['name LIKE ?', "%#{search}%"])
    else
      Room.all
    end
  end
end

def self.keyword_search(search)
  if search
    Room.where(['name LIKE ?', "%#{search}%"])
  else
    Room.all
  end
end