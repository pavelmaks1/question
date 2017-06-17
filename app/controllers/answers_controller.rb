class AnswersController < InheritedResources::Base
  actions :create, :update
  before_action :build_author, only: :create
  belongs_to :question
  respond_to :js, :json


  def update
    @question = Question.find(params[:question_id])
    
  end

  private

  def build_author
    build_resource.author = current_user
  end

  def answers_params
    params.require(:answer).permit(:body, :question_id, :author_id, :answerfile)
  end
end
