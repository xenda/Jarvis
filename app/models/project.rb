class Project < ActiveResource::Base
	
	self.site = "http://www.pivotaltracker.com/services/v3"
	headers['X-TrackerToken'] = '3fa226bc048021e8467040561f403381'
	
	def messages
		Message.where("project_id = :project_id", :project_id => id)
	end
end