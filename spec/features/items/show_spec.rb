# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'items show page' do
  before(:each) do
    stub_request(:get, 'http://localhost:3000/api/v1/items/4')
      .to_return(status: 200, body: File.read('spec/fixtures/item4.json'))
    stub_request(:get, 'http://localhost:3000/api/v1/merchants/1')
      .to_return(status: 200, body: File.read('spec/fixtures/merchant1.json'))

  end

  it 'displays the items name description and unit price' do
    visit item_path(4)

    expect(page).to have_content('Item Nemo Facere')
    expect(page).to have_content('Description: Item description here')
    expect(page).to have_content('Price: $42.91')
    expect(page).to have_link('Schroeder-Jerde', href: merchant_path(1))
  end
end
