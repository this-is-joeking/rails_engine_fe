# frozen_string_literal: true

class MerchantFacade
  def self.all_merchants
    merchants_data = StoreService.merchants
    merchants_data[:data].map do |merchant_data|
      Merchant.new(merchant_data)
    end
  end

  def self.merchant(id)
    merchant_data = StoreService.merchant(id)
    Merchant.new(merchant_data[:data])
  end

  def self.find_merchants(query)
    merchants_data = StoreService.find_merchants(query)
    merchants_data[:data].map do |merchant_data|
      Merchant.new(merchant_data)
    end
  end
end
