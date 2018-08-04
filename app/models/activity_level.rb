# Activity Level Model
class ActivityLevel < ApplicationRecord
  belongs_to :user
  validates :vitamin_c, :vitamin_d3, :iron, presence: true
  validates :vitamin_c, :vitamin_d3, :iron, numericality: { only_integer: true }
  validates_inclusion_of :vitamin_c, :vitamin_d3, :iron, in: 1..3, message: 'must be a positive integer between 1 to 3'
  validates_associated :user

  def to_builder
    Jbuilder.new do |activity_level|
      activity_level.id id
      activity_level.vitamin_c vitamin_c
      activity_level.vitamin_d3 vitamin_d3
      activity_level.iron iron
      activity_level.user_id user_id
    end
  end
end
