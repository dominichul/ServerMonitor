class SitesController < ApplicationController
	before_action :authenticate_user
	before_action :authenticate_owner, only: [:edit, :update, :destroy, :show]

	def index
		@sites = User.find_by_id(params[:user_id]).sites.paginate(page: params[:page], per_page: 10)
	end

	def show
		
	end

	def destroy
		Site.find_by_id(params[:id]).destroy
		redirect_to user_sites_path(params[:user_id])
	end

	def update
		@site = Site.find_by_id(params[:id])

		if @site.update_attributes(site_params)
			redirect_to current_user
		else
			@site.reload
			render 'edit'
		end
	end

	def edit
		@site = Site.find_by_id(params[:id])
	end

	def new
		@site = User.find_by_id(params[:user_id]).sites.new
	end

	def create

		@site = User.find_by_id(params[:user_id]).sites.build(site_params)
		if @site.save
			redirect_to user_sites_path(params[:user_id])
		else 
			render 'new'
		end
	end

	private

		def site_params
			params.require(:site).permit(:name, :ipaddress, :latitude, :longitude, :description, :callout, :autoLocate)
		end

		def authenticate_user
			@user = User.find_by_id(params[:user_id])
      		redirect_to(root_url) unless current_user?(@user)
		end

		def authenticate_owner
			site = Site.find_by_id(params[:id])
      		if  site == nil || current_user.email != site.owner
      			redirect_to root_path
      		end
		end

end
