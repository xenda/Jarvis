class MessagesController < ApplicationController
	def create
		@message = Message.new(params[:message])
		
		if @message.save
			redirect_to Project.find(@message.project_id)
		end
	end
end