class HomeController < ApplicationController
	before_filter :custom_auth_check
	def index
	end

	def custom_auth_check
		if admin_signed_in?
			redirect_to :dtsadmin
			return
		end
		if not client_signed_in?
			redirect_to :new_client_session
			return
		end
	end
end