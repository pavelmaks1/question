class QuestionsController < InheritedResources::Base
  before_action :authenticate_user!, except: [:index, :show]
  before_action :build_answer , only: :show
  before_action :build_author, only: :create


  protected

  def build_author
    build_resource.author = current_user
  end

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
