class MonstersController < ApplicationController
	def index
		@monsters = Monster.order(:name)
	end

	def new
		@monster = Monster.new
	end

	def create
		@monster = Monster.create(monster_params)
		redirect_to monsters_path
	end

	def edit
		@monster = Monster.find(params[:id])
	end

	def update
		@monster = Monster.find(params[:id])
		@monster.update_attributes(monster_params)
		redirect_to monsters_path
	end

	def show
		@monster = Monster.where(:id => params[:id]).first
		if @monster.blank?
			render :text => "Not Found", :status => :not_found
		end
	end

	def destroy
		@monster = Monster.find(params[:id])
		@monster.destroy
		redirect_to monsters_path
	end

	private

	def monster_params
		params.require(:monster).permit(:name, :size, :nature, :xp, monster_tags_attributes: [:id, :tag, :_destroy])
	end
end
