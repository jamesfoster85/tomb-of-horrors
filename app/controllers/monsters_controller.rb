class MonstersController < ApplicationController
	def index
		@monsters = Monster.all
	end

	def new
		@monster = Monster.new
		2.times { @monster.monster_tags.build}
	end

	def create
		@monster = Monster.create(monster_params)
		redirect_to root_path
	end

	def show
		@monster = Monster.where(:id => params[:id]).first
		if @monster.blank?
			render :text => "Not Found", :status => :not_found
		end
	end

	private

	def monster_params
		params.require(:monster).permit(:name, :size, :nature, monster_tags_attributes: [:id, :tag])
	end
end
