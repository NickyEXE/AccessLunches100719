class Review < ApplicationRecord
    belongs_to :restaurant
    belongs_to :user

    validates :rating, presence: true, inclusion: {in: 1..10}

end
