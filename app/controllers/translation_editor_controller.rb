class TranslationEditorController < ApplicationController
  def show
    @locale = params[:locale]
    I18n.locale = params[:locale]
    @questions = Question.all
  end
end
