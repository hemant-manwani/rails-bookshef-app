class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery with: :exception

  # filter_parameter_logging :password, :password_confirmation
  helper_method :current_admin_session, :current_admin_session

  private

  def current_admin_session
    return @current_admin_session if defined?(@current_admin_session)
    @current_admin_session = AdminSession.find
  end

  def current_admin
    return @current_admin if defined?(@current_admin)
    @current_admin = current_admin_session && current_admin_session.user
  end
end
