require 'rails_helper'

describe ContactsController, type: :controller do
  it 'returns 200 status code' do
    get :index
    expect(response).to have_http_status(:ok)
  end

  it 'returns the correct register' do
    contact = create(:contact)
    get :show, params: { id: contact.id }
    result = JSON.parse(response.body)['data']
    expect(result['id'].to_i).to eq(contact.id)
    expect(result['attributes']['contact-name']).to eq(contact.contact_name)
    expect(result['attributes']['email']).to eq(contact.email)
  end

  # it 'returns 200 status code' do
  #   get :show, params: { id: 1 }
  #   expect(response).to have_http_status(:ok)
  # end

  # it 'returns 201 status code' do
  #   get :post, params: {
  #     "data": {
  #         "type": "contacts",
  #         "attributes": {
  #             "contact_name": "Tiago Luis",
  #             "email": "tiagoluis@gmail.com",
  #             "birthdate": "1996-10-10"
  #         }
  #     } }
  #   expect(response).to have_http_status(:created)
  # end
end
