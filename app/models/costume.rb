class Costume < ApplicationRecord
  include CostumeConcern
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_many_attached :photos

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  
  pg_search_scope :search_by_name_and_category,
  against: [ :name, :category ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

  validates :name, :size, :category,  presence: true
end
