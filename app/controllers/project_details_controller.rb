class ProjectDetailsController < ApplicationController
	def create
		@detail = ProjectDetail.new(params[:project_detail])
		
		if @detail.save
			redirect_to project_path(@detail.project)
		else
			@project = @detail.project
			
			render_project_view
		end
	end
end