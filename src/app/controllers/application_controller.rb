class ApplicationController < ActionController::Base
  


    def after_sign_in_path_for(profile)

        if(current_user.profile)
            profile_path(current_user.profile.id)
        else
            new_profile_path || root_path
        end
    end

    
end
