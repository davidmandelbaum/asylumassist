class TranslationEditorController < ApplicationController
  def show
    @locale = params[:locale]
    I18n.locale = params[:locale]
    @questions = Question.all
  end

  def submit
    params.each do |k, v|
      puts "k = " + k
      puts "v = " + v
    end
  end
end
