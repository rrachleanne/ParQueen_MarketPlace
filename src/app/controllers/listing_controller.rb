class ListingController < ApplicationController
#search box feature. Searches for suburbs 12 miles (20km) from the suburb input adn returns products only available and if not purchased already
  def index
    if params["search"].present? 
     @products = Product.near(params["search"], 12, :order => :distance) 
    else
      @products=Product.where(availability:true, customer_id:nil)
    end
  end
end


