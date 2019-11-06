class Review < ApplicationRecord
    belongs_to :restaurant
    belongs_to :user

    validates :rating, numericality: { only_integer: true, less_than_or_equal_to: 10, greater_than_or_equal_to: 1 }

end
