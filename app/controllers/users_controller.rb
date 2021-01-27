class UsersController < ApplicationController
	
	def show
		@company = Company.find(current_user.company_id)		
	end

	def edit
		@company = Company.find(current_user.company_id)		
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		current_user.update(name: user_params[:name], email: user_params[:email], company_key: user_params[:company_key])
		company = Company.find(current_user.company_id)
		company.update(url: user_params[:url])
		redirect_to action: :show		
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :company_key, :url)
	end

end
