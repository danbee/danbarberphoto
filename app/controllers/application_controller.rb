class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def after_sign_in_path_for(resource_or_scope)
    admin_dashboard_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_admin_user_session_path
  end

  def render_404
    render 'errors/not_found', status: :not_found
  end

end
