class Service < ApplicationRecord
  SPECIALITIES = %W(bohemian minimalist modern industrial rustic scandinavian eclectic farmhouse asian)
  PROJECT_TYPE = %W(home bedroom kitchen restroom livingroom bathroom basement)
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :description, presence: true
  validates :speciality, inclusion: {in: SPECIALITIES}
  validates :project_type, inclusion: {in: PROJECT_TYPE}

  include PgSearch::Model
  pg_search_scope :search_by_speciality_description_project_type_user,
    against: [:speciality, :description, :project_type],
    associated_against: {
      user: [:name]
    },
    using: {tsearch: {prefix: true}}
end
