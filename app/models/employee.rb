class Employee < ApplicationRecord
  has_many :office_employees, dependent: :destroy
  has_many :offices, through: :office_employees

  validates :name, presence: true
  validates :position, presence: true
end
