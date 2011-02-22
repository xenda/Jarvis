class Message < ActiveRecord::Base
	attr_accessible :project_id, :content, :message_type
	
	default_scope :order => 'messages.created_at DESC'
end
