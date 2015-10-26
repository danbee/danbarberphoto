class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def after_sign_in_path_for(*)
    admin_dashboard_path
  end

  def after_sign_out_path_for(*)
    new_admin_user_session_path
  end

  def render_404
    render 'errors/not_found', status: :not_found
  end
end
