# frozen_string_literal: true

# A controller for all static pages
class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    if @article.save
      flash[:notice] = 'Your Article was saved successfully!'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = 'The article was updated'
      redirect_to article_path(@article)
    else
      flash[:notice] = 'Error: The article was not updated'
      render 'edit'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
