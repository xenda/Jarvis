class HomeController < ApplicationController
	def index
		@projects = Project.all #queria hacer un all, pero no salia nada u_u
	end
end