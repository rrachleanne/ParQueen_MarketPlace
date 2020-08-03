class ListingController < ApplicationController


  def index

    if params["search"].present? 
      
     @products = Product.near(params["search"], 100, :order => :distance) && @products=Product.where(availability:true, customer_id:nil)

    #  if params[:state]
    #   @products = Product.where(:state => params[:state])
    
    else
      @products=Product.where(availability:true, customer_id:nil)
  end
end
end
# end

