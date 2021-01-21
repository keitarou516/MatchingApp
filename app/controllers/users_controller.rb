class UsersController < ApplicationController
	
	def show
		@company = Company.find(current_user.company_id)		
	end
end
