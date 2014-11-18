class FormTextsController < ApplicationController
  before_action :set_form_text, only: [:show, :edit, :update, :destroy]

  def index
    @form_texts = FormText.all
    respond_with(@form_texts)
  end

  def show
    respond_with(@form_text)
  end

  def new
    @form_text = FormText.new
    respond_with(@form_text)
  end

  def edit
  end

  def create
    @form_text = FormText.new(form_text_params)
    @form_text.save
    respond_with(@form_text)
  end

  def update
    @form_text.update(form_text_params)
    respond_with(@form_text)
  end

  def destroy
    @form_text.destroy
    respond_with(@form_text)
  end

  private
    def set_form_text
      @form_text = FormText.find(params[:id])
    end

    def form_text_params
      params.require(:form_text).permit(:guidance, :seq_no, :page_id)
    end
end
