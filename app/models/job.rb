class Job < ApplicationRecord
  belongs_to :company

  validates :title, presence: true, length: { maximum: 60 }
  validates :company_id, presence: true
  validates :description, presence: true
  validates :requirements, presence: true
  validates :employee_benefits, presence: true
  validates :min_salary, presence: true, numericality: { greater_than: 0 }
  validates :max_salary, presence: true, numericality: { greater_than: :min_salary }

  has_rich_text :description
  has_rich_text :requirements
  has_rich_text :employee_benefits
end
