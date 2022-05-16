# frozen_string_literal: true

# A controller for all static pages
class StaticPagesController < ApplicationController
  def index
    @articles = Article.all
  end

  def about; end
end
