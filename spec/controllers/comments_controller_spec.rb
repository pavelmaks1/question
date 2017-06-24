require 'rails_helper'

RSpec.describe CommentsController , type: :controller do
  login_user

  describe 'POST#create' do
    let(:question) { create :question }
    let(:user) { create(:user) }
    let(:answer) { create :answer , author: user, question: question }

    it 'loads question of prent is a question' do
      post :create, params: { comment: attributes_for(:comment), question_id: question, format: :js }
      expect(assigns(:parent)).to eq question
    end

    it 'loads answer if parent is answer' do
      post :create, params: { comment: attributes_for(:comment), answer_id: answer, author: user, format: :js }
      expect(assigns(:parent)).to eq answer
    end
  end

end