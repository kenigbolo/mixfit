# User Service
class UserService
  attr_reader :user_params
  def initialize(params)
    @user_params = params
  end

  def create_user
    user = User.new(user_params_filtered)
    if user.save
      Result.new(user, true, nil)
    else
      Result.new(user, false, user.errors)
    end
  end

  def update_user(user)
    if user.update_attributes(user_params)
      Result.new(user: user, success: true, errors: nil)
    else
      Result.new(user: user, success: false, errors: user.errors)
    end
  end

  private

  def user_params_filtered
    params = user_params
    params[:weight] = 0.00 if params[:weight].nil?
    params[:height] = 0.00 if params[:height].nil?
    params
  end

  # Result class
  class Result
    attr_reader :user, :errors

    def initialize(user:, success:, errors:)
      @user = user
      @success = success
      @errors = errors
    end

    def success?
      @success
    end
  end
end
