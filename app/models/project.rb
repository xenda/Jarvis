class Project < ActiveResource::Base
	
	self.site = "http://www.pivotaltracker.com/services/v3"
	self.headers['X-TrackerToken'] = '3fa226bc048021e8467040561f403381'
	
	def details
		ProjectDetail.where(:project_id => self.id).order("name")
	end

  def build_message
    Message.new(:project_id => self.id)
  end

  def build_detail
		ProjectDetail.new(:project_id => self.id)
  end

	def members
		memberships = self.memberships.membership
    	memberships = [memberships] unless memberships.kind_of? Array
    	memberships
	end
	
	def messages
		Message.where(:project_id => self.id)
	end
end
