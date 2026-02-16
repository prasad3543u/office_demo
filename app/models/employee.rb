class Employee < ApplicationRecord
  has_secure_password

  has_many :office_employees
  has_many :offices, through: :office_employees

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
