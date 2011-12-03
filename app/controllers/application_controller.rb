class ApplicationController < ActionController::Base
  #protect_from_forgery

  before_filter :set_headers

  def set_headers
    response.headers["Access-Control-Allow-Origin"] = "*"
  end

end

