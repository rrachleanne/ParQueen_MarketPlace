class ListingController < ApplicationController
  def index
    if params["search"].present?
      
      @products = Product.near(params["search"], 100, :order => :distance)
     
      puts @products
    else
      @products=Product.all
  end
end
end