class ExcessesController < ApplicationController

	def new
		@company = Company.find(current_user.company_id)
		@excess = Excess.new
	end

end
