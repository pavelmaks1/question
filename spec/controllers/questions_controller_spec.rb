require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  describe 'GET #new' do
    login_user

    before { get :new }

    it 'assigns a new question to @question' do
      expect(assigns(:question)).to be_a_new(Question)
    end

    it 'build new attachment for question' do
      expect(assigns(:question).attachments.first).to be_a_new(Attachment)
    end

  end
end