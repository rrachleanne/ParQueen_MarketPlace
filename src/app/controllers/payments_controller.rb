class PaymentsController < ApplicationController


  def success
    #make and entry in the Product table
    puts params 
  
    #save productId and who ordered (by customer_id)
    @product =Product.find(params["productId"])
    @product.customer_id = current_user.profile.id
    @product.save
    #redirect to profile page
    redirect_to profile_path(current_user.profile.id)
    
  end
end
