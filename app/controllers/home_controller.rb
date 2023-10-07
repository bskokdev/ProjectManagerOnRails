class HomeController < ApplicationController
  before_action :authenticate_user!

  # Root path for the application
  def index
  end
end
