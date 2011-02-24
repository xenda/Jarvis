class ProjectsController < ApplicationController
	
	def index
		render 'home/index'
	end
	
	def show
		@project = Project.find(params[:id])
		@message = @project.build_message
		@detail = @project.build_detail
		
		@title = @project.name
	end
end