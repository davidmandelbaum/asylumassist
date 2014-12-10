class TranslatorController < ApplicationController

  def list
    @entries = Entry.where(needs_translation: true)
  end

end
