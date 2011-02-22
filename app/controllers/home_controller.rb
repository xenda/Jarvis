class HomeController < ApplicationController
	def index
		@projects = Project.first #queria hacer un all, pero no salia nada u_u
	end
end