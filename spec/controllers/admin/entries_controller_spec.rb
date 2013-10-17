require 'spec_helper'

describe Admin::EntriesController do
  context 'GET' do
    let!(:entry1) { create(:entry, name: 'test entry 1') }
    let!(:entry2) { create(:entry, name: 'test entry 2') }

    it 'redirects to the login page if not logged in' do
      get :index
      expect(response).to redirect_to new_admin_session_url
    end

    describe 'when logged in' do
      let(:admin) { create(:admin) }

      before do
        session[:admin_id] = admin.id
      end

      it 'assigns a list of entries' do
        get :index
        expect(assigns[:entries]).to include(entry1)
        expect(assigns[:entries]).to include(entry2)
      end
    end
  end

  context 'GET/1' do
    let(:entry) { create(:entry, name: 'test entry') }

    it 'redirects to the login page if not logged in' do
      get :show, id: entry.id
      expect(response).to redirect_to new_admin_session_url
    end

    describe 'when logged in' do
      let(:admin) { create(:admin) }

      before do
        session[:admin_id] = admin.id
      end

      it 'assigns the entry' do
        get :show, id: entry.id
        expect(assigns[:entry]).to eq entry
      end
    end
  end
end
