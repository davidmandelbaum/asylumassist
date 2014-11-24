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

    if !current_user.curr_entry
      @entry = Entry.new
      @entry.user = current_user
      @entry.save()
      current_user.curr_entry = @entry.id
      current_user.save()
    end
  end

  def review_answers
    @sections = Section.all
    if current_user.curr_entry
      @entry = Entry.find(current_user.curr_entry)
      @answers = @entry.answers
    else
      section = Section.find_by(seq_no: 4)
      # TODO: fix flash below (showing in params)
      redirect_to :controller => 'sections', :action => 'show', :id => section.id, :flash => { :notice => "No current form entry in progress" }
    end
  end

  def submit
    pdftk = PdfForms.new('/usr/local/bin/pdftk')
    @entry = Entry.find(current_user.curr_entry)
    @entry_answers = @entry.answers
    answers = {}

    @entry_answers.each do |a|
      answers[a.question.form_id] = a.text
    end

    form_path = Rails.public_path.to_s + '/i589.pdf'
    tmp_path = "#{Rails.root.to_s}/tmp/" + @entry.id.to_s

    pdftk.fill_form form_path, tmp_path, answers
    send_file(tmp_path, :filename => 'i589.pdf', :type => "application/pdf", :disposition => 'inline')
  end

  def show_submission
    @message = 'Submitted form stub'
    @tmp_path
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    session[:locale] = params[:locale]
  end

end
