class Api::V1::ArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_article, only: %i[show update destroy]

  # GET /articles
  def index
    @articles = Article.all
    render json: @articles, each_serializer: ArticleSerializer
  end

  # GET  /articles/:id
  def show
    render json: @article, serializer: ArticleSerializer
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    if @article.save
      render json: @article, serializer: ArticleSerializer
    else
      render json: { error: 'Unable to create Article.' }, status: 400
    end
  end

  # PUT /articles/:id
  def update
    if @article
      @article.update(article_params)
      render json: { message: 'Article successfully updated.' }, status: 200
    else
      ender json: { error: 'Unable to update article.' }, status: 400
    end
  end

  # DELETE /articles/:id
  def destroy
    if @article
      @article.destroy
      render json: { message: 'Article successfully deleted.' }, status: 200
    else
      render json: { error: 'Unable to delete article.' }, status: 400
    end
  end

  private

  def article_params
    params.permit(:title, :description)
  end

  def set_article
    @article = Article.eager_load(:comments).find(params[:id])
  end
end
