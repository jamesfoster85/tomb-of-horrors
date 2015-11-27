class RoomsController < ApplicationController
#	def index
#		@rooms = Room.all
#	end

	def new
		@dungeon = Dungeon.find(params[:dungeon_id])
		@room = Room.new
	end

	def create
		@dungeon = Dungeon.find(params[:dungeon_id])
		@room = @dungeon.rooms.create(room_params)
		redirect_to dungeon_path(@dungeon)
	end

#	def show
#		@room = Room.where(:id => params[:id]).first
#		if @room.blank?
#			render :text => "Not Found", :status => :not_found
#		end
#	end

#	def destroy
#		@room = Room.find(params[:id])
#		@room.destroy
#		redirect_to rooms_path
#	end

#	private

	def room_params
		params.require(:room).permit(:description, :length, :width)
	end
end

