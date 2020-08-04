class Service < ApplicationRecord
  SPECIALITIES = %W(bohemian minimalist modern industrial)
  PROJECT_TYPE = %W(home bedroom kitchen restroom livingroom)
  belongs_to :user
  validates :description, presence: true
  validates :speciality, inclusion: {in: SPECIALITIES}
  validates :project_type, inclusion: {in: PROJECT_TYPE}
end
