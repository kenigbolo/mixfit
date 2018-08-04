# Recipe Model
class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :activity_level
  belongs_to :food_intake
  
  validates :vitamin_c, :vitamin_d3, :iron, presence: true
  validates :vitamin_c, :vitamin_d3, :iron, numericality: { only_integer: true }
  validates_inclusion_of :vitamin_c, :vitamin_d3, :iron, in: 1..10
  validates_associated :user, :activity_level, :food_intake

  def to_builder
    Jbuilder.new do |recipe|
      recipe.id id
      recipe.vitamin_c vitamin_c
      recipe.vitamin_d3 vitamin_d3
      recipe.iron iron
      recipe.activity_level activity_level.to_builder
      recipe.food_intake food_intake.to_builder
    end
  end
end
