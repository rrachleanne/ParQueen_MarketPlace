class ListingController < ApplicationController


  def index

    if params["search"].present? 
      
     @products = Product.near(params["search"], 12, :order => :distance) 

    else
      @products=Product.where(availability:true, customer_id:nil)
  end
end

end
# end

