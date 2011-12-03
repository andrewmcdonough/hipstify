class ReviewsController < ApplicationController

  before_filter :load_blog
  def index
    @reviews = @blog.reviews
  end

  def show
    @review = @blog.reviews.find(params[:id])
  end

  def load_blog
    @blog = Blog.find(params[:blog_id])
  end
end
