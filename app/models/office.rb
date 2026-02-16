class Office < ApplicationRecord
  has_many :office_employees, dependent: :destroy
  has_many :employees, through: :office_employees

  validates :name, presence: true
  validates :location, presence: true
end
