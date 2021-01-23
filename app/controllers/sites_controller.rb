class SitesController < ApplicationController

	before_action :set_company, except: [:create]
	
	def index
		@sites = Site.where(company_id: params[:company_id])
	end

	def new
		@site = Site.new
	end

	def create
		Site.create(site_params)
	end

	private

	def site_params
		params.require(:site).permit(:name, :address, :start_date, :end_date, :resource, :wage, :phone, :mail, :text).merge(company_id: params[:company_id])
	end

	def set_company
		@company = Company.find(current_user.company_id)
	end

end
