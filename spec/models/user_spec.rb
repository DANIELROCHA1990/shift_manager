require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user, attributes) }
  let(:attributes) { { email: 'user@user.com', password: 'teste123', user_name: 'user' } }

  context 'Succes to create' do
    it 'user because is valid' do
      expect(subject).to be_valid
    end
  end

  context 'Failure to create' do
    it 'user without email' do
      attributes[:email] = nil
      expect(subject).not_to be_valid
    end

    # it 'user with email duplicated' do
    #   attributes[:email] = nil
    #   expect(subject).not_to be_valid
    # end

    it 'user without password' do
      attributes[:password] = nil
      expect(subject).not_to be_valid
    end
    it 'user without user_name' do
      attributes[:user_name] = nil
      expect(subject).not_to be_valid
    end
  end
end
