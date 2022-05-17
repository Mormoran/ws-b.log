# frozen_string_literal: true

# A controller for all comments
class CommentsController < ApplicationController
  before_action :set_article, only: %i[create, destroy]

  def create
    @comment = @article.comment.create(comment_params)

    if @comment.save
      flash[:notice] = 'Your Article was saved successfully!'
      redirect_to article_path(@article)
    else
      flash[:error] = 'Could not save comment. Please try again.'
      redirect_to article_path(@article)
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment deleted.'
    redirect_to articles_path
  end

  private

  def comment_params
    params.require(:comment).permit(:article_id, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
