# Api V1 UsersController
module Api
  module V1
    # UsersController
    class UsersController < Api::V1::BaseController
      before_action :set_service, :set_user
      def create
        return render json: @user.to_builder.target!, status: :ok if @user
        result = @user_service.create_user
        if result.success?
          render json: result.user, status: :ok
        else
          render json: result.errors, status: :unprocessable_entity
        end
      end

      def update
        return render json: err_json unless @user.present?
        result = @user_service.update_user(@user)
        if result.success?
          render json: result.user, status: :ok
        else
          render json: result.errors, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user)
              .permit(:username, :weight, :height).reject { |_, v| v.nil? }
      end

      def set_user
        @user = User.includes(:activity_levels, :food_intakes, :recipes)
                    .find_by_id(params[:id]) ||
                User.includes(:activity_levels, :food_intakes, :recipes)
                    .find_by_username(user_params[:username])
      end

      def set_service
        @user_service = UserService.new(user_params)
      end

      def err_json
        { error: 'No existing user with id ' + params[:id] }
      end
    end
  end
end
