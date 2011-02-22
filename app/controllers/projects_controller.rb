class ProjectsController < ApplicationController
	def show
		@project = Project.find(params[:id])
		@message = Message.new(:project_id => @project.id)
	end
end