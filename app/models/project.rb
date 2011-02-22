require 'rubygems'
require 'active_resource'

class Project < ActiveResource::Base
	self.site = "http://www.pivotaltracker.com/services/v3/projects"
	self.headers['X-TrackerToken'] = '3fa226bc048021e8467040561f403381'
end