class Service < ApplicationRecord
  SPECIALITIES = %W(bohemian minimalist modern industrial)
  PROJECT_TYPE = %W(home bedroom kitchen restroom livingroom)
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :description, presence: true
  validates :speciality, inclusion: {in: SPECIALITIES}
  validates :project_type, inclusion: {in: PROJECT_TYPE}

  include PgSearch::Model
  pg_search_scope :search_by_speciality_description_user,
    against: [:speciality, :description],
    associated_against: {
      user: [:name]
    },
    using: {tsearch: {prefix: true}}
end
