class EncountersController < ApplicationController
	def index
		@encounters = Encounter.all
	end

	def new
		@characters = Character.all.map{|c| c.name}
		@encounter = Encounter.new
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
		params.require(:encounter).permit(:difficulty, :characters)
	end	
end
