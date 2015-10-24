class EncountersController < ApplicationController
	def index
		@encounters = Encounter.all
	end

	def new
		@encounter = Encounter.new
		@encounter.characters.build
	end

	def create
		@encounter = Encounter.create(encounter_params)
		redirect_to encounters_path
	end

	def show
		@encounter = Encounter.where(:id => params[:id]).first
		if @encounter.blank?
			render :text => "Not Found", :status => :not_found
		end
	end

	private

	def encounter_params
		params.require(:encounter).permit(:difficulty, {:character_ids => []})
	end	
end
