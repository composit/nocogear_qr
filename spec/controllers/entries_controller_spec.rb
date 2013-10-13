require 'spec_helper'

describe EntriesController do
  context 'POST' do
    context 'with valid params' do
      let(:params) { { entry: FactoryGirl.attributes_for(:entry) } }

      it 'saves the entry' do
        expect { post :create, params }.to change { Entry.count }.by 1
      end

      it 'sets a flash message' do
        post :create, params
        expect(flash[:notice]).to eq 'Your submission has been received. Thanks!'
      end
    end

    context 'with invalid params' do
      let(:params) { { entry: { name: 'test' } } }

      it 'does not create an entry' do
        expect { post :create, params }.to_not change { Entry.count }
      end

      it 'assigns the entry' do
        post :create, params
        expect(assigns[:entry].name).to eq 'test'
      end
    end
  end
end
