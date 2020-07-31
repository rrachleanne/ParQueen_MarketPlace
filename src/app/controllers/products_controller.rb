class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  before_action :set_user_product, only:[:edit, :update, :destroy]
  before_action :store_location,:authenticate_user!

  def store_location
    if(request.path != "/users/sign_in" &&
      request.path != "/users/sign_up" &&
      request.path != "/users/password/new" &&
      request.path != "/users/password/edit" &&
      request.path != "/users/confirmation" &&
      request.path != "/users/sign_out" &&
      !request.xhr? && !current_user) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    previous_path = session[:previous_url]
    session[:previous_url] = nil
    previous_path || root_path
  end

  # GET /products
  # GET /products.json
  #SEARCH for suburb on lisitng page
  #sign in if not already signed in + redirects if signed in && to profile.id
  def index
    if params["search"] 
      @search=true
      @products= Product.where(suburb: params["search"])
    else
      if user_signed_in?
        if current_user.profile
          redirect_to profile_path(current_user.profile.id)
        else 
          redirect_to new_profile_path
      end
      else
        redirect_to new_user_session_path
      end
    end 
    end

  # GET /products/1
  # GET /products/1.json
  #STRIPE Method to redirect to payments/success controller
  def show
  
    if user_signed_in?
      if current_user.profile
    
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
          name: @product.suburb,
          description: @product.category,
          amount: @product.price * 100,
          currency: 'aud',
          quantity: 1,
      }],
      payment_intent_data: {
          metadata: {
              user_id: current_user.profile.id,
              product_id: @product.id
          }
      },
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&productId=#{@product.id}",
      cancel_url: "#{root_url}listing/index"
  )
  
  @session_id = session.id

else 
  redirect_to new_profile_path
end
else
redirect_to new_user_session_path
end

 
      
  end

  # GET /products/new
  #checking if signed in, if not = create profile or new user session. If == prompted @product.new
  def new

    if user_signed_in?
      if current_user.profile
        @product =Product.new
      else 
        redirect_to new_profile_path
    end
    else
      redirect_to new_user_session_path
    end
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  #create a product listing
  def create
    @product = Product.new(product_params)
    @product.vendor_id = current_user.id
    

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #if == to user show, edit, destroy
    def set_product
      @product = Product.find(params[:id])
    end
#if != to user,hide edit and destroy
  def set_user_product
    @product = Product.find(params[:id])
  end

  #webhook for stripe
  def webhook
    p params
  end
  # def full_address
  #   [street_no, street, suburb, state].compact.join(‘, ‘)
  #   end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:vendor_id, :customer_id, :state, :suburb, :category, :price, :availability, :picture, :street_no, :country, :street, :latitude, :longitude)
    end
end
