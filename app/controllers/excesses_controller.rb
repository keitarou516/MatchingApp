class ExcessesController < ApplicationController

	before_action :set_company, except: [:create, :destroy]
	before_action :set_excess, only: [:edit, :update, :destroy, :show]

	def index
		@excesses = Excess.where(company_id: params[:company_id]).order("created_at ASC")
	end

	def new
		@excess = Excess.new
	end

	def create
		Excess.create(excess_params)
		go_index
	end

	def edit
	end

	def	update
		@excess.update(excess_params)
		go_index
	end

	def destroy
		@excess.destroy
		go_index
	end

	def show
		@sites = Site.where('end_date > ? and ? > start_date', @excess.start_date, @excess.end_date)
		@sites = @sites.select { |site| (@excess.resource != 0) && (site.company_id != current_user.company_id) }
	end

	private

	def excess_params
		params.require(:excess).permit(:name, :start_date, :end_date, :resource, :phone, :mail, :text).merge(company_id: params[:company_id])
	end

	def set_excess
		@excess = Excess.find(params[:id])
	end

end
