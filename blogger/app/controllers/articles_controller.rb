class ArticlesController < ApplicationController
	include ArticlesHelper
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])

		@comment=Comment.new
		@comment.article_id = @article.id
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.save

		redirect_to article_path(@article), notice: "Article '#{@article.title}' is Live!"
	end

	def destroy
		Article.find(params[:id]).destroy

		redirect_to articles_path, notice: "Article '#{@article.title}' Destroyed!"
	end

	def edit
	 	@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		redirect_to article_path(@article), notice: "Article '#{@article.title}' Updated!"
	end
end
