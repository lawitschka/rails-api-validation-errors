require 'spec_helper'

describe Api::PeopleController, type: :controller do
  include RSpec::Rails::ControllerExampleGroup

  before :each do
    ActiveModel::Errors.enable_translations
  end

  it 'returns an errors hash' do
    post :create, params: { person: { name: '' } }

    expect(response).to be_successful

    json = JSON.parse(response.body).with_indifferent_access
    expect(json).to have_key :errors

    errors = json[:errors]
    expect(errors).to have_key :name
    expect(errors[:name]).to be_kind_of Array
    expect(errors[:name].first).to be_kind_of Hash

    name_error = errors[:name].first
    expect(name_error).to have_key :message
    expect(name_error).to have_key :meta
    expect(name_error[:message]).to match 'blank'
  end

end
