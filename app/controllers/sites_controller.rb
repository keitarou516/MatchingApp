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
		redirect_to action: :index
	end

	def edit
		@site = Site.find(params[:id])
	end

	def	update
		Site.update(site_params)
		go_index
	end

	def destroy
		site = Site.find(params[:id])
		site.destroy
		redirect_to action: :index
	end

	private

	def site_params
		params.require(:site).permit(:name, :address, :start_date, :end_date, :resource, :wage, :phone, :mail, :text).merge(company_id: params[:company_id])
	end

end
