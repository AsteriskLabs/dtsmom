class DtsadminController < ApplicationController
	before_filter :authenticate_admin!

	def index
		@clients = Client.select("id,email")
		@clientcounts = {}
		@clients.each do |client|
			@clientcounts[client.id] = Client.find(client.id).orders.count
		end
		@admins = Admin.select("id,email")
	end

	def addclient

		Client.create!(:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])

		redirect_to :root
	end

	def listclient
		@client = Client.select("id,email").find(params[:id])
		@orders = Client.find(params[:id]).orders
	end

	def addorder
		Client.find(params[:clientid]).orders.create(:title => params[:title], :description => params[:description], :status => params[:status])
		redirect_to(:controller => :dtsadmin, :action => :listclient, :id => params[:clientid])
	end

	def delorder
		Client.find(params[:clientid]).orders.find(params[:id]).destroy
		redirect_to(:controller => :dtsadmin, :action => :listclient, :id => params[:clientid])
	end
end