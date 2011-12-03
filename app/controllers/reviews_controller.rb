class ReviewsController < ApplicationController

  before_filter :load_blog

  respond_to :json, :html

  def index
    if @blog.nil?
      @reviews = Review.all
    else
      @reviews = @blog.reviews
    end
    respond_with @reviews
  end

  def show
    @review = @blog.reviews.find(params[:id])
  end

  def load_blog
    @blog = Blog.find(params[:blog_id]) if params[:blog_id]
  end
end
