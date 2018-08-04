# Api V1 Users::RecipesController
module Api
  module V1
    # Users::RecipesController
    class RecipesController < Api::V1::BaseController
      before_action :set_user

      def index
        return render json: user.recipes, status: :ok if @user.recipes.present?
        render json: { message: 'No recipes generated yet for ' + @user.username }
      end

      def new
        generate_recipe
      end

      def show
        recipe = Recipe.find_by(id: params[:id])
        return render json: recipe, status: :ok if recipe.present?
        render json: { error: 'No recipe with id ' + params[:id] }, status: :unprocessable_entity
      end

      private

      def set_user
        @user = User.find_by(id: params[:user_id])
        return render json: { error: 'No existing user with id ' + params[:user_id] } unless @user.present?
      end

      def generate_recipe
        #
      end
    end
  end
end
