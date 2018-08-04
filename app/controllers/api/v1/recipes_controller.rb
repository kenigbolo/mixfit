# Api V1 Users::RecipesController
module Api
  module V1
    # Users::RecipesController
    class RecipesController < Api::V1::BaseController
      before_action :set_user, :set_service

      def index
        @recipes = @recipe_service.user_recipes
        render json: @recipes, status: :ok
      end

      def new
        result = @recipe_service.generate_recipe
        if result.success?
          render json: result.user, status: :ok
        else
          render json: result.errors, status: :unprocessable_entity
        end
      end

      def show
        recipe = Recipe.find_by_id(params[:id])
        return render json: recipe.to_builder.target!, status: :ok if recipe
        render json: { error: 'No recipe with id ' + params[:id] }
      end

      private

      def set_user
        @user = User.find_by_id(params[:user_id])
        return if @user
        render json: { error: 'No existing user with id ' + params[:user_id] }
      end

      def set_service
        @recipe_service = RecipeService.new(@user)
      end
    end
  end
end
