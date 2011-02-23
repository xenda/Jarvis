class Project < ActiveResource::Base
	
	self.site = "http://www.pivotaltracker.com/services/v3"
	headers['X-TrackerToken'] = '3fa226bc048021e8467040561f403381'
	
	def messages
		Message.where(:project_id => self.id)
	end
	
	def members
		memberships = self.memberships.membership
    	memberships = [memberships] unless memberships.kind_of? Array
    	memberships
	end
	
end