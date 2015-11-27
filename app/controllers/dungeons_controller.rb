class DungeonsController < ApplicationController
	def index
		@dungeons = Dungeon.all
	end

	def new
		@dungeon = Dungeon.new
	end

	def create
		@dungeon = Dungeon.create#(dungeon_params)
		redirect_to dungeons_path
	end

	def show
		@dungeon = Dungeon.where(:id => params[:id]).first
		if @dungeon.blank?
			render :text => "Not Found", :status => :not_found
		end
	end

	def destroy
		@dungeon = Dungeon.find(params[:id])
		@dungeon.destroy
		redirect_to dungeons_path
	end

	private

#	def dungeon_params
#		params.require(:dungeon).permit()
#	end
end

