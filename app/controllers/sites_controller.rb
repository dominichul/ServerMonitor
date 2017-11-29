class SitesController < ApplicationController
	before_action :authenticate_user
	before_action :authenticate_owner, only: [:edit, :update, :destroy, :show]

	def index
		@sites = User.find_by_id(params[:user_id]).sites.paginate(page: params[:page], per_page: 5)
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
		start = Time.now
		@site = User.find_by_id(params[:user_id]).sites.build(site_params)
		@site.check_autoLocate
		start2 = Time.now
		if @site.save
		finish2 = Time.now
		diff2 = finish2 - start2
		puts "TIme to save site is #{diff2}"
			@site.check_server
			finish = Time.now
			diff = finish - start
			puts "Time from start of Create Req to right before redirect is #{diff}"
			redirect_to user_sites_path(params[:user_id])
		else
			finish = Time.now
			diff = finish - start
			puts "Time from start of Create Req to right before redirect is #{diff}" 
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
