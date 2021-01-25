class SitesController < ApplicationController

	before_action :set_company, except: [:create]
	before_action :set_site, only: [:edit, :update, :destroy]
	
	def index
		@sites = Site.where(company_id: params[:company_id]).order("created_at ASC")
	end

	def new
		@site = Site.new
	end

	def create
		Site.create(site_params)
		go_index
	end

	def edit
	end

	def	update
		@site.update(site_params)
		go_index
	end

	def destroy
		@site.destroy
		go_index
	end

	private

	def site_params
		params.require(:site).permit(:name, :address, :start_date, :end_date, :resource, :wage, :phone, :mail, :text).merge(company_id: params[:company_id])
	end

	def set_site
		@site = Site.find(params[:id])
	end

end
