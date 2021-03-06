# frozen_string_literal: true

# A controller for all articles
class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update show destroy]

  def index
    # @articles = Article.all.order(created_at: :desc)
    @articles = Article.all.paginate(page: params[:page], per_page: 5)
  end

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
    @comment = Comment.new
    @article.increment!(:views)
  end

  def edit; end

  def update
    set_article
    if @article.update(article_params)
      flash[:notice] = 'The article was updated'
      redirect_to article_path(@article)
    else
      flash[:notice] = 'Error: The article was not updated'
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = 'Article deleted.'
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.eager_load(:comments).find(params[:id])
  end
end
