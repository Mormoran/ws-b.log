class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_article, only: %i[index show create destroy]
  before_action :set_comment, only: %i[show destroy]

  # GET /articles/:article_id/comments
  def index
    @comments = @article.comments
    render json: @comments, each_serializer: CommentSerializer
  end

  # GET  /articles/:article_id/comments/:id
  def show
    @comment = Comment.find(params[:id])
    serialized_comment(200)
  end

  # POST /articles/:article_id/comments
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      serialized_comment(201)
    else
      render json: { error: 'Unable to create comment.' }, status: 400
    end
  end

  # DELETE /articles/:article_id/comments/:id
  def destroy
    if @comment
      @comment.destroy
      render json: { message: 'Comment successfully deleted.' }, status: 200
    else
      render json: { error: 'Unable to delete comment.' }, status: 400
    end
  end

  private

  def comment_params
    params.permit(:content, :article_id)
  end

  def set_article
    @article = Article.eager_load(:comments).find(params[:article_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def serialized_comment(status)
    render json: @comment, serializer: CommentSerializer, status: status
  end
end
