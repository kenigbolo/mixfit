# ActivityLevel Service
class ActivityLevelService
  attr_reader :user, :activity_level_params

  def initialize(user, params)
    @user = user
    @activity_level_params = params
  end

  def create_activity_level
    activity_level = user.activity_levels.new(activity_level_params)
    if activity_level.save
      build_activity_json(activity_level)
      UserService::Result.new(user: @activity_level, success: true, errors: nil)
    else
      UserService::Result.new(user: nil, success: false, errors: activity_level.errors)
    end
  end

  def update_activity_level(id)
    activity_level = ActivityLevel.find_by_id(id)
    return no_activity_found(id) unless activity_level.present?
    if activity_level.update_attributes(activity_level_params)
      build_activity_json(activity_level)
      UserService::Result.new(user: @activity_level, success: true, errors: nil)
    else
      UserService::Result.new(user: nil, success: false, errors: activity_level.errors)
    end
  end

  private

  def build_activity_json(activity_level)
    @activity_level = activity_level.to_builder.target!
  end

  def no_activity_found(id)
    err_json = { error: 'No existing activity with id ' + id }
    UserService::Result.new(user: nil, success: false, errors: err_json)
  end
end
