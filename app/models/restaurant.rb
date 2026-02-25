class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  CATEGORIES = [ "chinese", "italian", "japanese", "french", "belgian" ]

  validates :name, presence: { message: "Should not be blank" }
  validates :address, presence: { message: "Should not be blank" }
  validates :category, presence: true
  validates :category, inclusion: {
    in: CATEGORIES, message: "Is not a valid option"
  }
end
