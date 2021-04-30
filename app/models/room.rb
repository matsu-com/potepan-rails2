class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  attachment :image

  with_options presence: true do
    validates :title
    validates :body, length:{maximum: 140}
    validates :cost
    validates :place
    validates :image
  end

  # def self.search(search)
  #   if search
  #     Room.where(['name LIKE ?', "%#{search}%"])
  #   else
  #     Room.all
  #   end
  # end
  # def self.keyword_search(search)
  #   if search
  #     Room.where(['name LIKE ?', "%#{search}%"])
  #   else
  #     Room.all
  #   end
  # end
end
