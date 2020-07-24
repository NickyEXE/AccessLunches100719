class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :content, presence: true, length: {maximum: 500}
  validates :rating, inclusion: {in: (1..5), message: "should be between 1 and 5."}
end
