# Api V1 Users::FoodIntakesController
module Api
  module V1
    # FoodIntakesController
    class FoodIntakesController < Api::V1::BaseController
      before_action :set_user, :set_service

      def create
        result = @food_intake_service.create_food_intake
        if result.success?
          render json: result.user, status: :ok
        else
          render json: result.errors, status: :unprocessable_entity
        end
      end

      def update
        result = @food_intake_service.update_food_intake(params[:id])
        if result.success?
          render json: result.user, status: :ok
        else
          render json: result.errors, status: :unprocessable_entity
        end
      end

      private

      def food_intake_params
        params.require(:food_intake)
              .permit(:vitamin_c, :vitamin_d3, :iron).reject { |_, v| v.nil? }
      end

      def set_user
        @user = User.find_by(id: params[:user_id])
        return if @user.present?
        render json: { error: 'No existing user with id ' + params[:user_id] }
      end

      def set_service
        @food_intake_service = FoodIntakeService.new(@user, food_intake_params)
      end
    end
  end
end
