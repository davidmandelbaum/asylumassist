class HomeController < ApplicationController
  before_filter :authenticate_user!,
    :only => [:structure]

  def index
  end

  def structure
  end
end
