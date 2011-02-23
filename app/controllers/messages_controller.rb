class MessagesController < ApplicationController
	def create
		@message = Message.new(params[:message])
		
		if @message.save
			redirect_to project_path(@message.project_id)
		else
			@project = @message.project
			render 'projects/show'
		end
	end
end