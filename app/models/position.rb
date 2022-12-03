class Position < ApplicationRecord
  belongs_to :financial_plan

  validates :title, presence: true
  validates :number_of_employees_one, presence: true
  validates :number_of_employees_two, presence: true
  validates :number_of_employees_three, presence: true
  validates :number_of_employees_four, presence: true
  validates :number_of_employees_five, presence: true
  validates :base_annual_salary, presence: true
end
