require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_user) { build(:user, :valid_attrib) }
  let(:no_user_email) { build(:user, :no_email) }
  let(:no_user_password) { build(:user, :no_password) }
  let(:no_user_user_name) { build(:user, :no_user_name) }

  context 'Succes to create' do
    it 'user because is valid' do
      expect(valid_user).to be_valid
    end
  end

  context 'Failure to create' do
    it 'user without email' do
      expect(no_user_email).not_to be_valid
    end
    it 'user without password' do
      expect(no_user_password).not_to be_valid
    end
    it 'user without user_name' do
      expect(no_user_user_name).not_to be_valid
    end
  end
end
