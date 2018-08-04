# Api V1 Users::ActivityLevelsController
module Api
  module V1
    # Users::ActivityLevelsController
    class ActivityLevelsController < Api::V1::BaseController
      before_action :set_user, :set_service

      def create
        result = @activity_level_service.create_activity_level
        if result.success?
          render json: result.user, status: :ok
        else
          render json: result.errors, status: :unprocessable_entity
        end
      end

      def update
        result = @activity_level_service.update_activity_level(params[:id])
        if result.success?
          render json: result.user, status: :ok
        else
          render json: result.errors, status: :unprocessable_entity
        end
      end

      private

      def activity_level_params
        params.require(:activity_level)
              .permit(:vitamin_c, :vitamin_d3, :iron).reject { |_, v| v.nil? }
      end

      def set_user
        @user = User.find_by(id: params[:user_id])
        return if @user.present?
        render json: { error: 'No existing user with id ' + params[:user_id] }
      end

      def set_service
        @activity_level_service = ActivityLevelService.new(@user, activity_level_params)
      end
    end
  end
end
