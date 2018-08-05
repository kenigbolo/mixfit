require 'rails_helper'

RSpec.describe FoodIntakeService do
  before(:each) do
    params = { food_intake: { vitamin_c: 9, vitamin_d3: 8, iron: 7 } }
    user = FactoryBot.build(:user)
    @service = FoodIntakeService.new(user, params)
  end

  context 'service object' do
    it 'is a service object' do
      expect(@service.class).to eq(FoodIntakeService)
    end
  end

  context '#create_food_intake' do
    it `responds to a ::create_food_intake` do
      expect(@service).to respond_to(:create_food_intake)
    end
  end

  context '#update_food_intake' do
    it `responds to a ::update_food_intake` do
      expect(@service).to respond_to(:update_food_intake)
    end
  end
end
