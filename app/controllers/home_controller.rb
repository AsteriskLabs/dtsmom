class HomeController < ApplicationController
	before_filter :custom_auth_check
	def index
		@orders = Client.find(current_client.id).orders
	end

	def changepwdview
	end

	def changepwd
		Client.find(current_client.id).update_attributes(:password => params[:password], :password_confirmation => params[:password_confirmation])
		redirect_to :root
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