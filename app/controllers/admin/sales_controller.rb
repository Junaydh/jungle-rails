class Admin::SalesController < ApplicationController
  def index
    @sales = Sale.order(id: :desc).all
  end
end
