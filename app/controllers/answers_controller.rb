class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_answer, only: :update

  respond_to :js

  def create
    @question = Question.find(params[:question_id])
    @answer= @question.answers.build(answer_params)
    @answer.author = current_user
    @answer.save
    # respond_with(@answer= @question.answers.create(answer_params))
  end

  def update
    @answer.update(answer_params)
    respond_with @answer
  end

  private

  def load_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :question_id, :author_id, :answerfile)
  end
end
