class DashboardController < ApplicationController

  layout "dashboard"

  def index
    @blogs = Blog.all[0..3]
  end


end
