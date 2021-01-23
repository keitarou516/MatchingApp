class ExcessesController < ApplicationController

	def index
		@company = Company.find(current_user.company_id)
		@excesses = Excess.where(company_id: params[:company_id])
	end

	def new
		@company = Company.find(current_user.company_id)
		@excess = Excess.new
	end

	def create
		Excess.create(excess_params)
	end

	private

	def excess_params
		params.require(:excess).permit(:name, :start_date, :end_date, :resource, :phone, :mail, :text).merge(company_id: params[:company_id])
	end
end
