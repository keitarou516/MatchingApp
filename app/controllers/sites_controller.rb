class SitesController < ApplicationController
	
	def new
		@company = Company.find(current_user.company_id)
		@site = Site.new
	end

end
