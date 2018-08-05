require 'rails_helper'

RSpec.describe FoodIntake, type: :model do
  context 'when an food intake is created' do
    let(:food_intake) { FactoryBot.build :food_intake}

    it 'is a new food intake' do
      expect(food_intake).to be_a_new(FoodIntake)
    end

    it 'should be a valid food intake object' do
      expect(food_intake).to be_valid
    end
  end

  context 'when food intake does not have a valid vitamin_c value' do
    food_intake = FoodIntake.new(vitamin_c: nil)

    it 'is a new food intake' do
      expect(food_intake).to be_a_new(FoodIntake)
    end

    it 'should not be a valid food intake record' do
      expect(food_intake).not_to be_valid
    end

    it 'should not be able to save' do
      expect(food_intake.save).to be false
    end

    it 'should throw errors on save' do
      expect { food_intake.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is invalid when value is less than 4' do
      food_intake = FactoryBot.build(:food_intake, vitamin_c: 3)
      exception = 'Validation failed: Vitamin c must be a positive integer between 4 to 10'
      expect { food_intake.save! }.to raise_exception(exception)
    end

    it 'is invalid when value is greater than 10' do
      food_intake = FactoryBot.build(:food_intake, vitamin_c: 12)
      exception = 'Validation failed: Vitamin c must be a positive integer between 4 to 10'
      expect { food_intake.save! }.to raise_exception(exception)
    end
  end

  context 'when food intake does not have a valid vitamin_d3 value' do
    food_intake = FoodIntake.new(vitamin_d3: nil)

    it 'is a new food intake' do
      expect(food_intake).to be_a_new(FoodIntake)
    end

    it 'should not be a valid food intake record' do
      expect(food_intake).not_to be_valid
    end

    it 'should not be able to save' do
      expect(food_intake.save).to be false
    end

    it 'should throw errors on save' do
      expect { food_intake.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is invalid when value is less than 4' do
      food_intake = FactoryBot.build(:food_intake, vitamin_d3: 3)
      exception = 'Validation failed: Vitamin d3 must be a positive integer between 4 to 10'
      expect { food_intake.save! }.to raise_exception(exception)
    end

    it 'is invalid when value is greater than 10' do
      food_intake = FactoryBot.build(:food_intake, vitamin_d3: 12)
      exception = 'Validation failed: Vitamin d3 must be a positive integer between 4 to 10'
      expect { food_intake.save! }.to raise_exception(exception)
    end
  end

  context 'when food intake does not have a valid iron value' do
    food_intake = FoodIntake.new(iron: nil)

    it 'is a new food intake' do
      expect(food_intake).to be_a_new(FoodIntake)
    end

    it 'should not be a valid food intake record' do
      expect(food_intake).not_to be_valid
    end

    it 'should not be able to save' do
      expect(food_intake.save).to be false
    end

    it 'should throw errors on save' do
      expect { food_intake.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is invalid when value is less than 1' do
      food_intake = FactoryBot.build(:food_intake, iron: 3)
      exception = 'Validation failed: Iron must be a positive integer between 4 to 10'
      expect { food_intake.save! }.to raise_exception(exception)
    end

    it 'is invalid when value is greater than 3' do
      food_intake = FactoryBot.build(:food_intake, iron: 12)
      exception = 'Validation failed: Iron must be a positive integer between 4 to 10'
      expect { food_intake.save! }.to raise_exception(exception)
    end
  end

  context 'validates associations' do
    it { should belong_to(:user)}
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
