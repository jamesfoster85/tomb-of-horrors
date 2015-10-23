class CharactersController < ApplicationController
	def index
		@characters = Character.all
	end

	def new
		@character = Character.new
	end

	def create
		@character = Character.create(character_params)
		redirect_to characters_path
	end

	def show
		@character = Character.where(:id => params[:id]).first
		if @character.blank?
			render :text => "Not Found", :status => :not_found
		end
	end

	private

	def character_params
		params.require(:character).permit(:name, :level)
	end
end
