class TranslationEditorController < ApplicationController
  before_action :authenticate_user!

  def show
    @locale = params[:locale]
    I18n.locale = params[:locale]
    @questions = Question.all
    @pages_and_sections = []
    @pages = Page.all
    @sections = Section.all
  end

  def submit
    params.each do |k, v|
      if k.include? "text_"
        form_text_id = k[5..-1].to_i
        form_text = FormText.find(form_text_id)
        I18n.locale = params['locale']
        form_text.guidance = v
        form_text.save()
      end
      if k.include? "sect_"
        sect_id = k[10..-1].to_i
        section = Section.find(sect_id)
        if k.include? "sect_name_"
          I18n.locale = params['locale']
          section.name = v
        elsif k.include? "sect_guid_"
          I18n.locale = params['locale']
          section.guidance = v
        end
        section.save()
        next
      elsif k.include? "page_"
        page_id = k[10..-1].to_i
        page = Page.find(page_id)
        if k.include? "page_name_"
          I18n.locale = params['locale']
          page.name = v
        elsif k.include? "page_guid_"
          I18n.locale = params['locale']
          page.guidance = v
        end
        page.save()
      elsif k.include? "name_" or k.include? "expl_"
        q_id = k[5..-1].to_i
        question = Question.find(q_id)
        if k.include? "name_"
          I18n.locale = params['locale']
          question.name = v
        elsif k.include? "expl_"
          I18n.locale = params['locale']
          question.explanation = v
        end
        question.save()
        next
      end
    end
    redirect_to :action => 'show', :locale => params['locale']
  end
end
