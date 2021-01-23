class ExcessesController < ApplicationController

	before_action :set_company, except: [:create, :destroy]

	def index
		@excesses = Excess.where(company_id: params[:company_id])
	end

	def new
		@excess = Excess.new
	end

	def create
		Excess.create(excess_params)
		go_index
	end

	def edit
		@excess = Excess.find(params[:id])
	end

	def	update
		Excess.update(excess_params)
		go_index
	end

	def destroy
		excess = Excess.find(params[:id])
		excess.destroy
		go_index
	end

	private

	def excess_params
		params.require(:excess).permit(:name, :start_date, :end_date, :resource, :phone, :mail, :text).merge(company_id: params[:company_id])
	end

	def set_company
		@company = Company.find(current_user.company_id)
	end

	def go_index
		redirect_to action: :index
	end
end
