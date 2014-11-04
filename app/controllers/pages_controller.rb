class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    session[:curr_page] = @page
    current_user.curr_page = @page.id
    current_user.save
    @sections = Section.all
    @section = @page.section
    @next_section = Section.find_by_id(@page.section.id+1)
    @next_page = Page.find_by(seq_no: @page.seq_no+1)
    @page_responses
  end

  def submit
    params.each do |k, v|
      puts "k = " + k
      puts "v = " + v
      if k.include? "answer"
        q_id = k[7..-1].to_i
        answer = Answer.create( text: v, question: Question.find(q_id))
        answer.entry = Entry.find(current_user.curr_entry)
        answer.save()
      end
    end
    curr_seq_no = Page.find(params[:page]).seq_no
    next_page_id = Page.find_by(seq_no: curr_seq_no+1).id
    if next_page_id
      redirect_to :controller => 'pages', :action => 'show', :id => next_page_id
    else
      curr_section = Page.find(params[:page]).section
      next_section = Section.find_by(seq_no: curr_section.seq_no+1)
      if next_section
        redirect_to :controller => 'sections', :action => 'show', :id => next_section.id
      else
        redirect_to :controller => 'home', :action => 'review answers'
      end
    end
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:seq_no, :name, :guidance, :section_id)
    end
end
