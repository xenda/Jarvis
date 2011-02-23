class ProjectsController < ApplicationController
	
	def index
		render 'home/index'
	end
	
	def show
		@project = Project.find(params[:id])
		@message = Message.new(:project_id => @project.id)
		
		@title = @project.name
	end
end