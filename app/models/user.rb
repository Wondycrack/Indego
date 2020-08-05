class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  SPECIALITIES = %W(bohemian minimalist modern industrial)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :services, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  validates :speciality, inclusion: {in: SPECIALITIES}
end
