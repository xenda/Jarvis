class JarvisController < ApplicationController
	
	respond_to :js
	
	def jarvis
		#@id = get_id_by_host
		
		@id = 99714
		
		unless @id.nil?
			render 'jarvis/jarvis.js'
		else
			render :text => "ID incorrecto", :status => 404
		end
	end
	
	def latest
		@id = get_id_by_host
		
		last_id = (cookies.signed[:last_message].nil?) ? 0 : cookies.signed[:last_message]
		
		@messages = Message.where(:project_id => @id).where(["id > ?", last_id]).limit(3).reverse
		
		@response = Array.new
		
		@messages.map{
			|m| @response << {
				:id => m.id.to_s,
				:content => m.content,
				:type => m.message_type,
				:project_id => m.project_id
			}
		}
		
		cookies.permanent.signed[:last_message] = @messages.last.id.to_s unless @messages.last.nil?
		
		render :json => @response, :callback => params[:callback]
		
	end
	
	private
	
		def get_id_by_host
			host = request.env['HTTP_HOST']
			projectDetail = ProjectDetail.where(:name => "url", :value => host).first
			
			unless projectDetail.nil?
				projectDetail.project.id
			else
				nil
			end
		end
	
end