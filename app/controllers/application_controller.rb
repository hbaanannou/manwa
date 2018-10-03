class ApplicationController < ActionController::Base

	layout :layout_by_resource # by hany for Devise layout

	include Pundit # by Hany for pundit

	protect_from_forgery with: :exception


	# by Hany for pundit --start

	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized 


	private

	def user_not_authorized
		flash[:alert] = "You are not authorized to perform this action."
		# hany: add request.referrer  first to redirect to get form page
		redirect_to(request.referrer || root_path)
		# redirect_to(root_path)
	end

	# by Hany for pundit --end


	# by hany for Devise layout --start

	def layout_by_resource
    if devise_controller?
      "devise_layout"
    else
      "application"
    end
  end

	# by hany for Devise layout --end


end



