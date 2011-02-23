module ApplicationHelper
	
	def title
		" » #{@title}" unless @title.blank?
	end
	
end
