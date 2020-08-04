class Service < ApplicationRecord
  SPECIALITIES = %W(bohemian minimalist modern industrial)
  PROJECT_TYPE = %W(home bedroom kitchen restroom livingroom)
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :description, presence: true
  validates :speciality, inclusion: {in: SPECIALITIES}
  validates :project_type, inclusion: {in: PROJECT_TYPE}
end
