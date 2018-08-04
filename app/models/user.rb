# User Model
class User < ApplicationRecord
  before_save :calculate_bmi
  has_many :recipes
  has_many :food_intakes
  has_many :activity_levels

  validates :username, :height, :weight, :bmi, prescence: true
  validates :height, :weight, :bmi, numericality: true

  private

  def calculate_bmi
    self.bmi = weight / (height * height)
  end
end
