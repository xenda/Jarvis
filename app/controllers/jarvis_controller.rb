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
	
end