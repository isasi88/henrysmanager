class PagesController < ApplicationController
	def index
		@user = current_user
		@clientes = Cliente.all
		@projects = Project.all
		render 'landing'
	end

	def landing
		render 'landing'
	end

	def finances
		@user = current_user
		@projects = @user.projects.all
		if @projects
			@estimated = @user.projects.pluck(:price).sum
			@estimated_iva = @user.projects.pluck(:iva).sum
			@totalprice = @estimated + @estimated_iva
		else
			@estimated = 0
			@estimated_iva = 0
			@totalprice = 0
		end
	end
end
