# FoodIntake Service
class FoodIntakeService
  attr_reader :user, :food_intake_params

  def initialize(user, params)
    @user = user
    @food_intake_params = params
  end

  def create_food_intake
    food_intake = user.food_intakes.new(food_intake_params)
    if food_intake.save
      build_intake_json(food_intake)
      UserService::Result.new(user: @food_intake, success: true, errors: nil)
    else
      UserService::Result.new(user: nil, success: false, errors: food_intake.errors)
    end
  end

  def update_food_intake(id)
    food_intake = FoodIntake.find_by_id(id)
    return no_intake_found(id) unless food_intake.present?
    if food_intake.update_attributes(food_intake_params)
      build_intake_json(food_intake)
      UserService::Result.new(user: @food_intake, success: true, errors: nil)
    else
      UserService::Result.new(user: nil, success: false, errors: food_intake.errors)
    end
  end

  private

  def build_intake_json(food_intake)
    @food_intake = food_intake.to_builder.target!
  end

  def no_intake_found(id)
    err_json = { error: 'No existing intake with id ' + id }
    UserService::Result.new(user: nil, success: false, errors: err_json)
  end
end
