class Api::V1::ArticlesController < ApplicationController

  # GET /articles
  def index
    @articles = Article.all
    render json: @articles
  end

  # GET  /articles/:id
  def show
    @article = Article.find(params[:id])
    render json: @article
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    if @article.save
      render json: @article
    else
      render error: { error: 'Unable to create Article.' }, status: 400
    end
  end

  # PUT /articles/:id
  def update
    @article = Article.find(params[:id])
    if @article
      @article.update(article_params)
      render json: { message: 'Article successfully update. '}, status: 200
    else
      ender json: { error: 'Unable to update article. '}, status: 400
    end
  end

  # DELETE /articles/:id
  def destroy
    @article = Article.find(params[:id])
    if @article
      @article.destroy
      render json: { message: 'Article successfully deleted. '}, status: 200
    else
      render json: { error: 'Unable to delete article. '}, status: 400
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
