class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || profiles_path
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
