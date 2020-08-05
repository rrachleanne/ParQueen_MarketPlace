class HomeController < ApplicationController
  def after_sign_in_path_for(resource)
    profile_path(current_user.profile.id)
  end
  
  
  def page
    
  end
end
