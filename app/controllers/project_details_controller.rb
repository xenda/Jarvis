class ProjectDetailsController < ApplicationController
	
	def create
		@detail = ProjectDetail.new(params[:project_detail])
		
		if @detail.save
			redirect_to project_path(@detail.project_id)
		else
			@project = @detail.project
			render 'projects/show'
		end
	end
end