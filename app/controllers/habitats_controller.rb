class HabitatsController < ApplicationController
	def index
		@habitats = Habitat.all
	end

	def new
		@habitat = Habitat.new
		@monsters = Monster.order(:xp)
	end

	def create
		@habitat = Habitat.create(habitat_params)
		redirect_to habitats_path
	end

	def show
		@habitat = Habitat.where(:id => params[:id]).first
		if @habitat.blank?
			render :text => "Not Found", :status => :not_found
		end
	end

	def destroy
		@habitat = Habitat.find(params[:id])
		@habitat.destroy
		redirect_to habitats_path
	end

	private

	def habitat_params
		params.require(:habitat).permit(:name, {:monster_ids => []})
	end
end
