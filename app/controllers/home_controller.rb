class HomeController < ApplicationController
	before_filter :custom_auth_check
	def index
		@orders = Client.find(current_client.id).orders.sort_by {|order| order[:updated_at]}.reverse
		@items = {}
		@orders.each do |order|
			@items[order.id] = order.items.sort_by {|item| item[:updated_at]}.reverse
		end
		@email_updates = Client.find(current_client.id).email_updates.nil? ? false : Client.find(current_client.id).email_updates
	end

	def changepwdview
	end

	def changepwd
		Client.find(current_client.id).update_attributes(:password => params[:password], :password_confirmation => params[:password_confirmation])
		redirect_to :root
	end

	def changeemailstatus
		newval = nil
		newval = params[:status] == "yes" ? true : false
		puts "HAHAHAHA: " + newval.to_s
		Client.find(current_client.id).update_attributes(:email_updates => newval)
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