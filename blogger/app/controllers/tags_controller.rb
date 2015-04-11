class TagsController < ApplicationController
	def index
		@tags=Tag.all

		redirect_to articles_path
	end

	def show
		@tag = Tag.find(params[:id])
	end

	def destroy
		Tag.find(params[:id]).destroy

		redirect_to articles_path
	end
end
