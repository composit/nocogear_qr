require 'spec_helper'

describe Admin do
  context 'authenticating' do
    let(:admin) { create(:admin, username: 'testuser', password: 'testpass', password_confirmation: 'testpass') }

    it 'authenticates with proper password' do
      expect(admin.authenticate('testpass')).to be_true
    end

    it 'does not authenticate with incorrect password' do
      expect(admin.authenticate('otherpass')).to be_false
    end
  end
end
