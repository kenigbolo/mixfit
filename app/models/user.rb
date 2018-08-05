# User Model
class User < ApplicationRecord
  before_save :calculate_bmi
  has_many :recipes
  has_many :food_intakes
  has_many :activity_levels

  validates :username, :height, :weight, presence: true
  validates :username, uniqueness: true
  validates :height, :weight, numericality: true

  def to_builder
    Jbuilder.new do |user|
      user.id id
      user.weight weight
      user.height height
      user.bmi bmi
      user.created_at created_at.strftime("%Y-%m-%d")
    end
  end

  private

  def calculate_bmi
    return self.bmi = 0.00 if weight == 0.00 && height == 0.00
    self.bmi = (weight / (height * height)).round(2)
  end
end
