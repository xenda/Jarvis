class ProjectDetailsController < ApplicationController

	def create
		@detail = ProjectDetail.new(params[:project_detail])
		
		if @detail.save
			flash[:message] = "Detalle de proyecto enviado satisfactoriamente"
			
			redirect_to project_path(@detail.project)
    	else
    		flash[:warning] = "Hubo un error al momento de enviar el detalle de proyecto"
    		
    		@project = @detail.project
      		
			render_project_view
		end
	end
	
	#Algún día los implementaré... algún día u_u
	
	def edit
	end
	
	def update
	end
	
	def destroy
		detail = ProjectDetail.find(params[:id])
		detail.destroy
		redirect_to detail.project
	end
end
