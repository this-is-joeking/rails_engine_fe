class ItemsController < ApplicationController
  def index
    @items = ItemFacade.all_items
  end
end