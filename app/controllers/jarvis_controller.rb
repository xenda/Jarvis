class JarvisController < ApplicationController
	
	respond_to :js
	
	def jarvis
		@id = get_id_by_host
		
		if @id 
			render 'jarvis/jarvis.js'
		else
			render :text => "ID incorrecto", :status => 404
		end

	end
	
	def latest
		@id = get_id_by_host
		
		last_id = (cookies.signed[:last_message].nil?) ? 0 : cookies.signed[:last_message]
		
		@messages = Message.where(:project_id => @id).where(["id > ?", last_id]).limit(3).reverse
		
		@response = @messages.map{|m| 
                                {
                                  :id => m.id.to_s,
                                  :content => m.content,
                                  :type => m.message_type,
                                  :project_id => m.project_id
                                }
		}
		
    	cookies.permanent.signed[:last_message] = @messages.last.id.to_s if @messages.last
		
		render :json => @response, :callback => params[:callback]
		
	end
	
	private
	
		def get_id_by_host
			host = request.env['HTTP_REFERER']

			projectDetail = ProjectDetail.where(:name => "url", :value => host).first
			
			if projectDetail
				projectDetail.project_id
			else
				nil
			end

		end
	
end
