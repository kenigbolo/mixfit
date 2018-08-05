require 'rails_helper'

RSpec.describe Recipe, type: :model do
  context 'when a recipe is created' do
    let(:recipe) { FactoryBot.build :recipe }

    it 'is a new recipe' do
      expect(recipe).to be_a_new(Recipe)
    end

    it 'should be a valid recipe record' do
      expect(recipe).to be_valid
    end
  end

  context 'when recipe does not have a valid vitamin_c value' do
    recipe = Recipe.new(vitamin_c: nil)

    it 'is a new recipe' do
      expect(recipe).to be_a_new(Recipe)
    end

    it 'should not be a valid recipe record' do
      expect(recipe).not_to be_valid
    end

    it 'should not be able to save' do
      expect(recipe.save).to be false
    end

    it 'should throw errors on save' do
      expect { recipe.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is invalid when value is less than 1' do
      recipe = FactoryBot.build(:recipe, vitamin_c: 0)
      exception = 'Validation failed: Vitamin c must be a positive integer between 1 to 10'
      expect { recipe.save! }.to raise_exception(exception)
    end

    it 'is invalid when value is greater than 10' do
      recipe = FactoryBot.build(:recipe, vitamin_c: 12)
      exception = 'Validation failed: Vitamin c must be a positive integer between 1 to 10'
      expect { recipe.save! }.to raise_exception(exception)
    end
  end

  context 'when recipe does not have a valid vitamin_d3 value' do
    recipe = Recipe.new(vitamin_d3: nil)

    it 'is a new recipe' do
      expect(recipe).to be_a_new(Recipe)
    end

    it 'should not be a valid recipe record' do
      expect(recipe).not_to be_valid
    end

    it 'should not be able to save' do
      expect(recipe.save).to be false
    end

    it 'should throw errors on save' do
      expect { recipe.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is invalid when value is less than 1' do
      recipe = FactoryBot.build(:recipe, vitamin_d3: 0)
      exception = 'Validation failed: Vitamin d3 must be a positive integer between 1 to 10'
      expect { recipe.save! }.to raise_exception(exception)
    end

    it 'is invalid when value is greater than 10' do
      recipe = FactoryBot.build(:recipe, vitamin_d3: 12)
      exception = 'Validation failed: Vitamin d3 must be a positive integer between 1 to 10'
      expect { recipe.save! }.to raise_exception(exception)
    end
  end

  context 'when recipe does not have a valid iron value' do
    recipe = Recipe.new(iron: nil)

    it 'is a new recipe' do
      expect(recipe).to be_a_new(Recipe)
    end

    it 'should not be a valid recipe record' do
      expect(recipe).not_to be_valid
    end

    it 'should not be able to save' do
      expect(recipe.save).to be false
    end

    it 'should throw errors on save' do
      expect { recipe.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is invalid when value is less than 1' do
      recipe = FactoryBot.build(:recipe, iron: 0)
      exception = 'Validation failed: Iron must be a positive integer between 1 to 10'
      expect { recipe.save! }.to raise_exception(exception)
    end

    it 'is invalid when value is greater than 3' do
      recipe = FactoryBot.build(:recipe, iron: 12)
      exception = 'Validation failed: Iron must be a positive integer between 1 to 10'
      expect { recipe.save! }.to raise_exception(exception)
    end
  end

  context 'validates associations' do
    it { should belong_to(:user) }
    it { should belong_to(:food_intake) }
    it { should belong_to(:activity_level) }
  end

  context 'validates presences' do
    it { should validate_presence_of(:vitamin_c) }
    it { should validate_presence_of(:vitamin_d3) }
    it { should validate_presence_of(:iron) }
  end

  context 'validates numericality' do
    it { should validate_numericality_of(:vitamin_c) }
    it { should validate_numericality_of(:vitamin_d3) }
    it { should validate_numericality_of(:iron) }
  end
end
