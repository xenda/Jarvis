class MessagesController < ApplicationController
	
	def create
    	@message = Message.new(params[:message])

		if @message.save
			flash[:message] = "Mensaje enviado satisfactoriamente"
			
			redirect_to project_path(@message.project)
		else
			flash[:warning] = "Hubo un error al momento de enviar el mensaje"
			
			@project = @message.project
			
			render_project_view
		end
	end
end
