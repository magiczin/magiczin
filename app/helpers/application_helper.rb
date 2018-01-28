module ApplicationHelper
  def active_class(target_controller)
    return 'active' if params[:controller] == target_controller.to_s
  end
end
