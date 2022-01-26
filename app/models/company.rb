class Company < ApplicationRecord
  has_many :jobs, dependent: :destroy

  validates :code, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :name, presence: true, length: { maximum: 160 }
  # validates :media_coverage, presence: true
  validates :mission, presence: true
  validates :description, presence: true
  validates :benefits, presence: true

  has_rich_text :media_coverage
  has_rich_text :mission
  has_rich_text :description
  has_rich_text :benefits
end
