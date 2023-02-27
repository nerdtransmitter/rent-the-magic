class Costume < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_one_attached :photo

  validates :name, :size, :category, presence: true
  validates :name, uniqueness: true
end
