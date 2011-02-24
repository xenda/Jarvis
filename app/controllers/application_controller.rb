class ApplicationController < ActionController::Base
	protect_from_forgery
	
	def render_project_view
		@message ||= setup_message
		@detail ||= setup_detail
		
		render 'projects/show'
	end
	
	private
		def setup_message
			@message = Message.new(:project_id => @project.id)
		end
		
		def setup_detail
			@detail = ProjectDetail.new(:project_id => @project.id)
		end
end
