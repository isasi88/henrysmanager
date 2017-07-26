class PagesController < ApplicationController
	def index
		@user = current_user
		@clientes = Cliente.all
		@projects = Project.all
		render 'index'
	end
end
