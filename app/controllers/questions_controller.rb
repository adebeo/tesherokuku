class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_filter :get_level
  before_filter :authenticate_user!

  def get_level
    @level = Level.find(params[:level_id])
    @program = Program.find(@level.id)
  end
  
  
  # GET /questions
  # GET /questions.json
  def index
    @questions = @level.questions
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = @level.questions.find(params[:id])
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = @level.questions.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to [@program,@level,@question], notice: 'Questions was successfully created.' }
        format.json { render :show, status: :created, location: @questions }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to [@program,@level,@question], notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to program_level_questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:name, :description, :lien, :order, :level_id)
    end
end
