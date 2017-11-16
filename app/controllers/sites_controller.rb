class SitesController < ApplicationController
	
	def index
		@sites = User.find(params[:user_id]).sites
	end

	def show
		
	end

	def update
		@site = Site.find(params[:id])

		if @site.update_attributes(site_params)
			redirect_to current_user
		else
			@site.reload
			render 'edit'
		end
	end

	def edit
		@site = Site.find(params[:id])
	end

	def new
		@site = User.find(params[:user_id]).sites.new
	end

	def create

		@site = User.find(params[:user_id]).sites.build(site_params)

		if @site.save
			redirect_to user_sites_path(params[:user_id])
		else 
			render 'new'
		end
	end

	private

		def site_params
			params.require(:site).permit(:name, :ipaddress, :latitude, :longitude, :description, :callout, :autoLocate, :ssl)
		end

end
