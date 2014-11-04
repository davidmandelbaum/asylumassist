class HomeController < ApplicationController
  before_action :set_locale

  before_filter :authenticate_user!,
    :only => [:structure]

  def index
    if current_user
      page = current_user.curr_page
      if page != nil
        redirect_to :controller => 'pages', :action => 'show', :id => page
      end
    end
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

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

end
