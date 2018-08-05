require 'rails_helper'

RSpec.describe UserService do
  before(:each) do
    params = { user: { username: 'test', weight: 75, height: 1.73 } }
    @service = UserService.new(params)
  end

  context 'service object' do
    it 'is a service object' do
      expect(@service.class).to eq(UserService)
    end
  end

  context '#create_user' do
    it `responds to a ::create_user` do
      expect(@service).to respond_to(:create_user)
    end
  end

  context '#update_user' do
    it `responds to a ::update_user` do
      expect(@service).to respond_to(:update_user)
    end
  end
end
