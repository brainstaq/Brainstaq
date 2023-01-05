class Position < ApplicationRecord
  belongs_to :business_plan
  mount_uploader :image, ImageUploader

  validates :bio, length: { maximum: 60 }

  def total_salaries_one
    self.number_of_employees_one * (self.base_annual_salary * (1 + (self.salaries_cgr1 * 0.01)) * (1 + (self.salary_benefits * 0.01)))
  end

  def total_salaries_two
    self.number_of_employees_two * (self.base_annual_salary * (1 + (self.salaries_cgr2 * 0.01)) * (1 + (self.salary_benefits * 0.01)))
  end

  def total_salaries_three
    self.number_of_employees_three * (self.base_annual_salary * (1 + (self.salaries_cgr3 * 0.01)) * (1 + (self.salary_benefits * 0.01)))
  end

  def total_salaries_four
    self.number_of_employees_four * (self.base_annual_salary * (1 + (self.salaries_cgr4 * 0.01)) * (1 + (self.salary_benefits * 0.01)))
  end

  def total_salaries_five
    self.number_of_employees_five * (self.base_annual_salary * (1 + (self.salaries_cgr5 * 0.01)) * (1 + (self.salary_benefits * 0.01)))
  end
end