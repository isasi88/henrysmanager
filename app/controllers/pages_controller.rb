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
		if @projects?
			@estimated = @projects.pluck(:price).sum
			@estimated_iva = @projects.pluck(:iva).sum
			@totalprice = @estimated + @estimated_iva
		end
	end
end
