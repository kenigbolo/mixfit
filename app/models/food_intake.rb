# Food Intake Model
class FoodIntake < ApplicationRecord
  belongs_to :user
  validates :vitamin_c, :vitamin_d3, :iron, presence: true
  validates :vitamin_c, :vitamin_d3, :iron, numericality: { only_integer: true }
  validates_inclusion_of :vitamin_c, :vitamin_d3, :iron, in: 4..10, message: 'must be a positive integer between 4 to 10'
  validates_associated :user

  def to_builder
    Jbuilder.new do |food_intake|
      food_intake.id id
      food_intake.vitamin_c vitamin_c
      food_intake.vitamin_d3 vitamin_d3
      food_intake.iron iron
      food_intake.user_id user_id
    end
  end
end
