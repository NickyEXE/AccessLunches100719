class Review < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant
    validates :rating, numericality: { greater_than: -1, less_than: 11, only_integer: true }

end
