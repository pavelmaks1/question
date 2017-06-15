class QuestionsController < InheritedResources::Base
  before_action :authenticate_user!, except: [:index, :show]
  before_action :build_answer , only: :show


  def create
    @question= Question.create(question_params)
    @question.author = current_user
    create!
  end

  private


  def build_answer
    @answer = resource.answers.build
  end

  def question_params
    params.require(:question).permit(:title, :body, :author_id, :file)
  end

  def set_question
    @question = Question.find(params[:id])
  end

end
