class ApplicationController < ActionController::Base
  


    def after_sign_in_path_for(profile)

        if(current_user.profile)
            profile_path(current_user.profile.id)
        else
            new_profile_path || root_path
        end
    end

    def not_found
        raise ActionController::RoutingError.new('Not Found')
      rescue
        render_404
      end
    
      def render_404
        render file: "#{Rails.root}/public/404", status: :not_found
      end
      
end
