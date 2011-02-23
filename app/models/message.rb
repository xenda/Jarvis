require 'pusher'

Pusher.app_id = '4257'
Pusher.key = '90f6559f5192ab317c82'
Pusher.secret = '45e1f34e897be27489e2'

class Message < ActiveRecord::Base
	
	#attributes:
	attr_accessible :project_id, :content, :message_type
	
	validates :content, :presence => true, :length => {:maximum => 255}
	
	after_create :send_to_pusher
	
	TYPES = %w[warning advise message]
	
	default_scope :order => 'messages.created_at DESC'
	
	def send_to_pusher
		Pusher["xenda-jarvis-#{self.project_id}"].trigger('create', {:id => self.id.to_s,
																	:content => self.content,
																	:type => self.message_type,
																	:project_id => project_id})
	end
end
