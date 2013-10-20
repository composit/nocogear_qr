require 'spec_helper'

describe Admin::SessionsController do
  context 'POST' do
    context 'if the params do not authenticate' do
      it 'does not assign the session admin_id' do
        post :create, { username: 'test', password: 'test' }
        expect(session[:admin_id]).to be_nil
      end

      it 'redirects to the login page' do
        post :create, { username: 'test', password: 'test' }
        expect(response).to redirect_to new_admin_session_url
      end
    end

    context 'if the params authenticate' do
      let!(:admin) { create(:admin, username: 'testuser', password: 'testpass', password_confirmation: 'testpass') }

      before do
        post :create, { username: 'testuser', password: 'testpass' }
      end

      it 'assigns the session admin_id' do
        expect(session[:admin_id]).to eq admin.id
      end

      it 'redirects to the admin entries page' do
        expect(response).to redirect_to admin_entries_url
      end
    end
  end

  context 'DESTROY/1' do
    context 'when destroying a session' do
      let(:admin) { create :admin }
      
      before do
        session[:admin_id] = admin.id
        delete :destroy, id: admin.id
      end

      it 'unsets the session admin_id' do
        expect(session[:admin_id]).to be_nil
      end

      it 'redirects to the login page' do
        expect(response).to redirect_to new_admin_session_url
      end
    end
  end
end
