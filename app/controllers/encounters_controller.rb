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
		@encounter.add_creatures
		redirect_to encounter_path(@encounter)
	end

	def show
		@encounter = Encounter.where(:id => params[:id]).first
		if @encounter.blank?
			render :text => "Not Found", :status => :not_found
		end
		@characters = @encounter.characters
		@difficulty = @encounter.difficulty
		@habitat = @encounter.habitat
	end

	def destroy
		@encounter = Encounter.find(params[:id])
		@encounter.destroy
		redirect_to encounters_path
	end

	private

	def encounter_params
		params.require(:encounter).permit(:difficulty, :habitat_id, {:character_ids => []})
	end	
end
