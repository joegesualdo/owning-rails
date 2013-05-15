class HomeController < ApplicationController
  # before_action :header

  def index
    @message = "Instance var!"
    render :index
  end

  def header
    response.write "<h1>My App</h1>"
  end
end