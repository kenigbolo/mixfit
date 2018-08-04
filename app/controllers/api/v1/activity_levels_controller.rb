# Api V1 Users::ActivityLevelsController
module Api
  module V1
    # Users::ActivityLevelsController
    class ActivityLevelsController < Api::V1::BaseController
      before_action :set_user

      def create
        create_activity_level
      end

      def update
        update_activity_level
      end

      private

      def activity_level_params
        params.require(:activity_level)
              .permit(:vitamin_c, :vitamin_d3, :iron).reject { |_, v| v.nil? }
      end

      def set_user
        @user = User.find_by(id: params[:user_id])
        return render json: { error: 'No existing user with id ' + params[:user_id] } unless @user.present?
      end

      def create_activity_level
        activity_level = @user.activity_levels.new(activity_level_params)
        if activity_level.save
          render json: @user.attributes.merge(activity_level: activity_level), status: :ok
        else
          render json: activity_level.errors, status: :unprocessable_entity
        end
      end

      def update_activity_level
        activity_level = ActivityLevel.find_by(id: params[:id])
        if activity_level&.update_attributes(activity_level_params)
          render json: @user.attributes.merge(activity_level: activity_level), status: :ok
        else
          render json: activity_level.errors, status: :unprocessable_entity
        end
      end
    end
  end
end
