# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = ItemFacade.all_items
  end

  def show
    @item = ItemFacade.item(params[:id])
    @merchant = MerchantFacade.merchant(@item.merchant_id)
  end
end
