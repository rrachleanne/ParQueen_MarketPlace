class ListingController < ApplicationController


  def index

    if params["search"].present? 
      
     @products = Product.near(params["search"], 100, :order => :distance)

    #  if params[:state]
    #   @products = Product.where(:state => params[:state])
    
    else
      @products=Product.all
  end
end
end
# end

