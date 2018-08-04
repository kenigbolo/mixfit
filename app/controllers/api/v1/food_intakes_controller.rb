# Api V1 Users::FoodIntakesController
module Api
  module V1
    # FoodIntakesController .order("updated_at").last
    class FoodIntakesController < Api::V1::BaseController
      before_action :set_user

      def create
        save_food_intake
      end

      def update
        update_food_intake
      end

      private

      def food_intake_params
        params.require(:food_intake)
              .permit(:vitamin_c, :vitamin_d3, :iron).reject { |_, v| v.nil? }
      end

      def set_user
        @user = User.find_by(id: params[:user_id])
        return render json: { error: 'No existing user with id ' + params[:user_id] } unless @user.present?
      end

      def save_food_intake
        food_intake = @user.food_intakes.new(food_intake_params)
        if food_intake.save
          render json: @user.attributes.merge(food_intake: food_intake), status: :ok
        else
          render json: food_intake.errors, status: :unprocessable_entity
        end
      end

      def update_food_intake
        food_intake = FoodIntake.find_by(id: params[:id])
        if food_intake&.update_attributes(food_intake_params)
          render json: @user.attributes.merge(food_intake: food_intake), status: :ok
        else
          render json: food_intake.errors, status: :unprocessable_entity
        end
      end
    end
  end
end
