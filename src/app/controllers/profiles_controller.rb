class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!

  before_action :store_location,:authenticate_user!

  def store_location
    if(request.path != "/users/sign_in" &&
      request.path != "/users/sign_up" &&
      request.path != "/users/password/new" &&
      request.path != "/users/password/edit" &&
      request.path != "/users/confirmation" &&
      request.path != "/users/sign_out" &&
      !request.xhr? && !current_user)
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    previous_path = session[:previous_url]
    session[:previous_url] = nil
    previous_path || root_path
  end

  # GET /profiles
  # GET /profiles.json
  def index

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

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  

    if user_signed_in?
      if current_user.profile
        render 'show'
      else 
        redirect_to new_profile_path
    end
    else
      redirect_to new_user_session_path
    end

  end

 

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profiles_path, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #only allows current user to amend own profile, cannot edit other profiles
    def set_profile

      if user_signed_in?
      
        @profile = current_user.profile || current_user.build_profile
      else 
        redirect_to new_profile_path
    end
     
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:user_id, :name, :phone, :picture)
    end
end
