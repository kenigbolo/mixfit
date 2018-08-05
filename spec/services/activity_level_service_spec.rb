require 'rails_helper'

RSpec.describe ActivityLevelService do
  before(:each) do
    params = { activity_level: { vitamin_c: 9, vitamin_d3: 8, iron: 7 } }
    user = FactoryBot.build(:user)
    @service = ActivityLevelService.new(user, params)
  end

  context 'service object' do
    it 'is a service object' do
      expect(@service.class).to eq(ActivityLevelService)
    end
  end

  context '#create_activity_level' do
    it `responds to a ::create_activity_level` do
      expect(@service).to respond_to(:create_activity_level)
    end
  end

  context '#update_activity_level' do
    it `responds to a ::update_activity_level` do
      expect(@service).to respond_to(:update_activity_level)
    end
  end
end
