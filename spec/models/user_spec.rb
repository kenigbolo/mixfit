require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when a user is created' do
    let(:user) { FactoryBot.build :user }

    it 'is a new user' do
      expect(user).to be_a_new(User)
    end

    it 'should be a valid user object' do
      expect(user).to be_valid
    end
  end

  context 'when user does not have a username' do
    user = User.new(username: nil)

    it 'is a new user' do
      expect(user).to be_a_new(User)
    end

    it 'should not be a valid user object' do
      expect(user).not_to be_valid
    end

    it 'should not be able to save without required parameters' do
      expect(user.save).to be false
    end

    it 'should thow errors on save' do
      expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'when user does not have a weight' do
    user = User.new(weight: nil)

    it 'is a new user' do
      expect(user).to be_a_new(User)
    end

    it 'should not be a valid user object' do
      expect(user).not_to be_valid
    end

    it 'should not be able to save without required parameters' do
      expect(user.save).to be false
    end

    it 'should thow errors on save' do
      expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'when user does not have a height' do
    user = User.new(height: nil)

    it 'is a new user' do
      expect(user).to be_a_new(User)
    end

    it 'should not be a valid user object' do
      expect(user).not_to be_valid
    end

    it 'should not be able to save without required parameters' do
      expect(user.save).to be false
    end

    it 'should thow errors on save' do
      expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'validates associations' do
    it { should have_many(:recipes) }
    it { should have_many(:activity_levels) }
    it { should have_many(:food_intakes) }
  end
end
