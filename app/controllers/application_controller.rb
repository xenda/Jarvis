class ApplicationController < ActionController::Base
	protect_from_forgery
	
	def render_project_view

		@message ||= @project.build_message 
		@detail  ||= @project.build_detail

		render 'projects/show'

	end

end
