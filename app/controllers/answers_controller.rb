class AnswersController < InheritedResources::Base
  actions :create, :update, :destroy
  before_action :build_author, only: :create
  belongs_to :question
  respond_to :js, :json



  private

  def build_author
    build_resource.author = current_user
  end

  def answers_params
    params.require(:answer).permit(:body, :question_id, :author_id, :answerfile)
  end
end
