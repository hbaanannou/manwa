module ApplicationHelper

	# by hany for menu active class
	# * is a splat operator to accept array of arrguments
  def controller?(*controller_string)
    controller_string.include?(params[:controller])
  end

  def action?(*action_string)
    action_string.include?(params[:action])
  end
  # by Hany --end


end
