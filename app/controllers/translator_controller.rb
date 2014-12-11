class TranslatorController < ApplicationController

  def list
    @entries = Entry.where(needs_translation: true)
  end

  def show
    @entry = Entry.find(params[:id])

    @answers = @entry.get_translate_answers

  end

  def submit

  end

end
