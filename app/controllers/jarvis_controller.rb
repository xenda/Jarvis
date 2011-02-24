class JarvisController < ApplicationController
	
	respond_to :js
	
	def jarvis
		@id = params[:project]
		
		unless @id.nil?
			render 'jarvis/jarvis.js'
		else
			render :text => "ID incorrecto", :status => 404 #render :nothing => true
		end
	end
	
	def latest
		@id = params[:project]
		
		last_id = (cookies.signed[:last_message].nil?) ? 0 : cookies.signed[:last_message]
		
		@messages = Message.where(:project_id => @id).where(["id > ?", last_id]).limit(3)
		
		@response = Array.new
		
		@messages.map{
			|m| @response << {
				:id => m.id.to_s,
				:content => m.content,
				:type => m.message_type,
				:project_id => m.project_id
			}
		}
		
		cookies.permanent.signed[:last_message] = @messages.last.id.to_s
		
		render :json => @response, :callback => params[:callback]
		
	end
	
end