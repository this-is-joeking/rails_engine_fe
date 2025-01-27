# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemFacade do
  before(:each) do
    stub_request(:get, 'http://localhost:3000/api/v1/merchants/1/items')
      .to_return(status: 200, body: File.read('spec/fixtures/merchant1_items.json'))
    stub_request(:get, 'http://localhost:3000/api/v1/items')
      .to_return(status: 200, body: File.read('spec/fixtures/items.json'))
    stub_request(:get, 'http://localhost:3000/api/v1/items/4')
      .to_return(status: 200, body: File.read('spec/fixtures/item4.json'))
  end

  describe '#merchant_items()' do
    it 'returns all of a given merchants items as poros' do
      items = ItemFacade.merchant_items(1)

      items.each do |item|
        expect(item).to be_an Item
        expect(item.merchant_id).to eq(1)
      end
    end
  end

  describe '#all_items' do
    it 'returns all items as poros' do
      items = ItemFacade.all_items

      items.each do |item|
        expect(item).to be_an Item
      end
    end
  end

  describe '#item()' do
    it 'returns a single item as a poro' do
      item = ItemFacade.item(4)

      expect(item).to be_an Item
      expect(item.id).to eq(4)
    end
  end
end
