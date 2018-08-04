# Activity Level Model
class ActivityLevel < ApplicationRecord
  belongs_to :user
  validates :vitamin_c, :vitamin_d3, :iron, presence: true
  validates :vitamin_c, :vitamin_d3, :iron, numericality: { only_integer: true }
  validates_inclusion_of :vitamin_c, :vitamin_d3, :iron, in: 1..3
  validates_associated :user
end
