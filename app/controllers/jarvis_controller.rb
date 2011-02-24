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
		
		@messages = Message.where(:project_id => @id).limit(3)
		
		@response = Array.new
		
		@messages.map{
			|m| @response << {
				:id => m.id.to_s,
				:content => m.content,
				:type => m.message_type,
				:project_id => m.project_id
			}
		}
		
		render :json => @response
		
	end
	
end