class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :build_answer, only: :show

  respond_to :html , :json

  def index
    respond_with(@questions = Question.all)
  end

  def show
    respond_with @question
  end

  def new
    respond_with(@question = Question.new)
  end

  def edit
  end

  def create
    respond_with(@question = Question.create(question_params))
  end

  def update
    @question.update(question_params)
    respond_with @question
  end

  def destroy
    respond_with(@question.destroy)
  end

  private

  def build_answer
    @answer = @question.answers.build
  end

  def question_params
    params.require(:question).permit(:title, :body, :file)
  end

  def set_question
    @question = Question.find(params[:id])
  end

end
