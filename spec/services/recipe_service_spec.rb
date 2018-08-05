require 'rails_helper'

RSpec.describe RecipeService do
  before(:each) do
    @user = FactoryBot.create(:user)
    @food_intake = FactoryBot.create(:food_intake, user: @user)
    @activity_lvl = FactoryBot.create(:activity_level, user: @user)
    @service = RecipeService.new(@user)
  end

  context 'service object' do
    it 'is a service object' do
      expect(@service.class).to eq(RecipeService)
    end
  end

  context '#generate_recipe' do
    it `responds to a ::generate_recipe` do
      expect(@service).to respond_to(:generate_recipe)
    end
  end

  context '#user_recipes' do
    it `responds to a ::user_recipes` do
      expect(@service).to respond_to(:user_recipes)
    end
  end

  context 'Generates correct recipe' do
    it 'generates the correct recipe for vitamin_c' do
      recipe = @service.generate_recipe
      recipe_hash = JSON.parse recipe.user.gsub('=>', ':')
      expect(recipe_hash['vitamin_c']).to eq @service.vitamin_c
    end

    it 'generates the correct recipe for vitamin_d3' do
      recipe = @service.generate_recipe
      recipe_hash = JSON.parse recipe.user.gsub('=>', ':')
      expect(recipe_hash['vitamin_d3']).to eq @service.vitamin_d3
    end

    it 'generates the correct recipe for iron' do
      recipe = @service.generate_recipe
      recipe_hash = JSON.parse recipe.user.gsub('=>', ':')
      expect(recipe_hash['iron']).to eq @service.iron
    end
  end

  context 'All recipes' do
    it 'returns all available user recipes' do
      @service.generate_recipe
      expect(@service.user_recipes.empty?).to be false
    end
  end
end
