class AnswersController < InheritedResources::Base
actions :create, :update

belongs_to :question


  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answers_params)
    @answer.author = current_user

    respond_to do |format|
      if @answer.save
        format.js
      else
        format.js
      end
    end


  end

  def update
    @answer = Answer.find(params[:id])
    @answer.update(answers_params)
    @question = @answer.question

  end


  private

  def answers_params
    params.require(:answer).permit(:body, :question_id, :author_id, :answerfile)
  end
end
