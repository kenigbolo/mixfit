require 'rails_helper'

RSpec.describe ActivityLevel, type: :model do
  context 'when an activity level is created' do
    let(:activity_level) { FactoryBot.build :activity_level}

    it 'is a new activity level' do
      expect(activity_level).to be_a_new(ActivityLevel)
    end

    it 'should be a valid activity level object' do
      expect(activity_level).to be_valid
    end
  end

  context 'when activity level does not have a valid vitamin_c value' do
    activity_level = ActivityLevel.new(vitamin_c: nil)

    it 'is a new activity level' do
      expect(activity_level).to be_a_new(ActivityLevel)
    end

    it 'should not be a valid activity level record' do
      expect(activity_level).not_to be_valid
    end

    it 'should not be able to save' do
      expect(activity_level.save).to be false
    end

    it 'should throw errors on save' do
      expect { activity_level.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is invalid when value is less than 1' do
      activity_level = FactoryBot.build(:activity_level, vitamin_c: 0)
      exception = 'Validation failed: Vitamin c must be a positive integer between 1 to 3'
      expect { activity_level.save! }.to raise_exception(exception)
    end

    it 'is invalid when value is greater than 3' do
      activity_level = FactoryBot.build(:activity_level, vitamin_c: 4)
      exception = 'Validation failed: Vitamin c must be a positive integer between 1 to 3'
      expect { activity_level.save! }.to raise_exception(exception)
    end
  end

  context 'when activity level does not have a valid vitamin_d3 value' do
    activity_level = ActivityLevel.new(vitamin_d3: nil)

    it 'is a new activity level' do
      expect(activity_level).to be_a_new(ActivityLevel)
    end

    it 'should not be a valid activity level record' do
      expect(activity_level).not_to be_valid
    end

    it 'should not be able to save' do
      expect(activity_level.save).to be false
    end

    it 'should throw errors on save' do
      expect { activity_level.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is invalid when value is less than 1' do
      activity_level = FactoryBot.build(:activity_level, vitamin_d3: 0)
      exception = 'Validation failed: Vitamin d3 must be a positive integer between 1 to 3'
      expect { activity_level.save! }.to raise_exception(exception)
    end

    it 'is invalid when value is greater than 3' do
      activity_level = FactoryBot.build(:activity_level, vitamin_d3: 4)
      exception = 'Validation failed: Vitamin d3 must be a positive integer between 1 to 3'
      expect { activity_level.save! }.to raise_exception(exception)
    end
  end

  context 'when activity level does not have a valid iron value' do
    activity_level = ActivityLevel.new(iron: nil)

    it 'is a new activity level' do
      expect(activity_level).to be_a_new(ActivityLevel)
    end

    it 'should not be a valid activity level record' do
      expect(activity_level).not_to be_valid
    end

    it 'should not be able to save' do
      expect(activity_level.save).to be false
    end

    it 'should throw errors on save' do
      expect { activity_level.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is invalid when value is less than 1' do
      activity_level = FactoryBot.build(:activity_level, iron: 0)
      exception = 'Validation failed: Iron must be a positive integer between 1 to 3'
      expect { activity_level.save! }.to raise_exception(exception)
    end

    it 'is invalid when value is greater than 3' do
      activity_level = FactoryBot.build(:activity_level, iron: 4)
      exception = 'Validation failed: Iron must be a positive integer between 1 to 3'
      expect { activity_level.save! }.to raise_exception(exception)
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
