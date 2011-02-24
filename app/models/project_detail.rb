class ProjectDetail < ActiveRecord::Base
	
	#attributes:
	attr_accessible :project_id, :name, :value
	
	validates :name, :presence => true, :length => {:maximum => 255}
	validates :value, :presence => true, :length => {:maximum => 255}
	
	def project
		if project_id.nil?
			Project.new
		else
			Project.find(project_id)
		end
	end
	
end
