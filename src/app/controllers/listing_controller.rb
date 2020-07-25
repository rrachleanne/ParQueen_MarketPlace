class ListingController < ApplicationController
  def page
  
    @products=Product.all

end
end
