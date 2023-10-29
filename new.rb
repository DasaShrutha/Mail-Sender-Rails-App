require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    let(:email) { 'kush@gmail.com' }
    let(:password) { 'ankush123' }
    let(:params) { 
      { user: {
          name: 'User 1',
          email: email,
          password: password
        }
      }
    }

    context 'when the user is new' do
      it 'creates the user and no error is thrown' do
        post :create, params: params
        response_body = JSON.parse(response.body)
        data = response_body['data']
        expect(response.status).to eq(200)
        expect(data['email']).to eq(email)        
      end
    end

    context 'when the user is already present' do
      it 'returns an error because the email should be unique' do
        params[:user][:name] = 'User 2'
        post :create, params: params
        expect(response.status).to eq(422)
      end
    end
  end
end
