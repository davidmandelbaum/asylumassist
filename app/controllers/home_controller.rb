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
    # set locale
    u = current_user
    u.locale = params[:locale] || session[:locale]
    # TODO: don't make duplicate entries
    @entry = Entry.new
    @entry.user = current_user
    @entry.save()
    current_user.curr_entry = @entry.id
    current_user.save()
  end

  def review_answers
    @sections = Section.all
    @entry = Entry.find(current_user.curr_entry)
    @answers = @entry.answers
  end

  def submit
    redirect_to '/home/show_submission'
  end

  def show_submission
    @message = 'Submitted form stub'
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    session[:locale] = params[:locale]
  end

end
