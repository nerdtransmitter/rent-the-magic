class Costume < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, :size, :category, presence: true
  validates :name, uniqueness: true
end
