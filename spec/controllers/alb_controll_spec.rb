require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

    describe 'searching db' do
    it 'calls the model method that performs the db search' do
        expect(Album).to receive(:find_in_db).with('random string')
        post :search_db, {:search => 'random string'}
        
    end
    it 'selects the Search results templates for rendering' do
        allow(Album).to receive(:find_in_db)
        post :search_db, {:search => 'random string'}
        expect(response).to render_template('search_db')
    end
    it 'makes the db search results available to that template' do
        @fake_results = [double('Album'), double('Album')]
        allow(Album).to receive(:find_in_db).and_return(@fake_results)
        post :search_db, {:search => 'random string'}
        expect(assigns(:albums)).to eq(@fake_results)
    end
  end


end