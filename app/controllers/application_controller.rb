class ApplicationController < ActionController::Base
  protect_from_forgery

  def dev?; Rails.env == 'development'; end
  def prod?; Rails.env == 'production'; end
  def stage?; Rails.env == 'staging'; end
  def test?; Rails.env == 'test'; end
  helper_method :dev?, :prod?, :stage?, :test?
	helper_method :current_user, :user_signed_in?
  private

  	def user_signed_in?; return (!current_user.blank?); end
  	
  	# Is a current user?  	
  	def current_user?; return (!current_user.blank?); end

    # Eval if user is the current user
    def is_current_user?(u=nil); return (u === current_user); end

    # Reload current user information
    def reload_current_user; @current_user = User.find(current_user.id) if current_user?; end

		def current_user
			logger.debug "ApplicationController::current_user"
			return @current_user if defined?(@current_user)
			@current_user = User.find_by_uid(session[:current_user_id])
		end

		def require_user
			logger.debug "ApplicationController::require_user"
			unless current_user
				store_location
				flash[:notice] = t('controllers.application.require_user.notice')
				redirect_to signin_url
				return false
			end
		end

		def require_no_user
			logger.debug "ApplicationController::require_no_user"
			if current_user
				flash[:notice] = t('controllers.application.require_no_user.notice')
				redirect_to request.referrer || root_url
			return false
			end
		end

		def require_admin_user
			logger.debug "ApplicationController::require_admin_user"
			render_unauthorized unless current_user && current_user.admin?
		end

		def store_location
			session[:return_to] = request.url
		end

		def redirect_back_or_default(default=nil)
			redirect_to(session[:return_to] || default || root_url)
			session[:return_to] = nil
		end
end
