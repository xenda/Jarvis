class MessagesController < ApplicationController
	def create
		@message = Message.new(params[:message])
		
		if @message.save
			redirect_to project_path(@message.project)
		else
			@project = @message.project
			
			render_project_view
		end
	end
end