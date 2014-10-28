class HomeController < ApplicationController
  before_filter :authenticate_user!,
    :only => [:structure]

  def index
  end

  def structure
  end

  def review_answers
    @sections = Section.all
  end

  def submit
    redirect_to '/home/show_submission'
  end

  def show_submission
    @message = 'Submitted form stub'
  end

end
