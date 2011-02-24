class ProjectDetail < ActiveRecord::Base
	
	#attributes:
	attr_accessible :project_id, :name, :value
	
	validates :name, :presence => true
	validates :value, :presence => true
	
	def project
		if project_id.nil?
			Project.new
		else
			Project.find(project_id)
		end
	end
	
end
