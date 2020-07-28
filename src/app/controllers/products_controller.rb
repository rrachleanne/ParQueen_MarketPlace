class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  before_action :set_user_product, only:[:edit, :update, :destroy]
  
 
  

  # GET /products
  # GET /products.json
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
  #checking user signed in, current_user.profile and = to product.vendor to re-direct to their profile [end if you want to show orginal show] 
  def show
  
      
  end

  # GET /products/new
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
    def set_product
      @product = Product.find(params[:id])
    end

  def set_user_product
    @product = Product.find(params[:id])
  end
 
  # def full_address
  #   [street_no, street, suburb, state].compact.join(‘, ‘)
  #   end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:vendor_id, :customer_id, :state, :suburb, :category, :price, :availability, :picture, :street_no, :country, :street, :latitude, :longitude)
    end
end
