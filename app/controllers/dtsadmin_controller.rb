class DtsadminController < ApplicationController
	before_filter :authenticate_admin!

	def index
		@clients = Client.select("id,name")
		@clientcounts = {}
		@clients.each do |client|
			@clientcounts[client.id] = Client.find(client.id).orders.count
		end
		@admins = Admin.select("id,email")
	end

	def addclient
		Client.create!(:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation], :name => params[:name])
		redirect_to :root
	end

	def changepwdview
	end

	def changepwd
		Admin.find(current_admin.id).update_attributes(:password => params[:password], :password_confirmation => params[:password_confirmation])
		redirect_to(:controller => :dtsadmin, :action => :index)
	end

	def listclient
		@client = Client.select("id,email,name").find(params[:id].to_i)
		@items = {}
		@orders = Client.find(params[:id].to_i).orders
		@orders.each do |order|
			@items[order.id] = order.items
		end
		@statuses = Status.all
	end

	def addorder
		neworder = Client.find(params[:clientid].to_i).orders.create(:title => params[:title], :description => params[:description])
		neworder.admin = current_admin
		neworder.save
		redirect_to(:controller => :dtsadmin, :action => :listclient, :id => params[:clientid].to_i)
	end

	def delorder
		Client.find(params[:clientid].to_i).orders.find(params[:id]).destroy
		redirect_to(:controller => :dtsadmin, :action => :listclient, :id => params[:clientid].to_i)
	end

	def updateorder
		Client.find(params[:clientid].to_i).orders.find(params[:id].to_i).update_attributes(:title => params[:title], :description => params[:description])
		redirect_to(:controller => :dtsadmin, :action => :listclient, :id => params[:clientid].to_i)
	end

	def additem
		Client.find(params[:clientid].to_i).orders.find(params[:orderid].to_i).items.create(:description => params[:description],:status => params[:status])
		Client.find(params[:clientid].to_i).orders.find(params[:orderid].to_i).touch
		redirect_to(:controller => :dtsadmin, :action => :listclient, :id => params[:clientid].to_i)
	end

	def updateitem
		Client.find(params[:clientid].to_i).orders.find(params[:orderid].to_i).items.find(params[:id].to_i).update_attributes(:description => params[:description], :status => params[:status])
		Client.find(params[:clientid].to_i).orders.find(params[:orderid].to_i).touch
		redirect_to(:controller => :dtsadmin, :action => :listclient, :id => params[:clientid].to_i)
	end

	def delitem
		Client.find(params[:clientid].to_i).orders.find(params[:orderid].to_i).items.find(params[:id].to_i).destroy
		Client.find(params[:clientid].to_i).orders.find(params[:orderid].to_i).touch
		redirect_to(:controller => :dtsadmin, :action => :listclient, :id => params[:clientid].to_i)
	end	
end