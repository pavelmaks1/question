require 'rails_helper'

RSpec.describe AnswersController , type: :controller do
  let(:user) { create(:user) }
  let!(:question) { create :question , author: user}

  describe 'POST #create' do

    context 'with valid attributes ' do


    end


  end

  describe 'PATCH #update' do
    let(:answer) { create(:answer, question: question, author: user) }

    it 'assigns the requested answer to @answer' do
      patch :update, params: { id: answer, question_id: question, author_id: user, answer: attributes_for(:answer), format: :js }
      expect(assigns(:answer)).to eq answer
    end

    it 'assigns the question' do
      patch :update, params: { id: answer, question_id: question, author_id: user, answer: attributes_for(:answer), format: :js }
      expect(assigns(:question)).to eq question
    end

    it 'changes answer attributes' do
      patch :update, params: { id: answer, question_id: question, answer: { body: 'new body'} , format: :js }
      answer.reload
      expect(answer.body).to eq 'new body'
    end

    it 'render update template ' do
      patch :update, params: { id: answer, question_id: question, answer: attributes_for(:answer), format: :js }
      expect(response).to render_template :update
    end
  end

end