class Project < ActiveRecord::Base
	belongs_to :cliente
	belongs_to :user
end
