require 'rails_helper'

feature 'answer editing' do

  given(:user) { create(:user) }
  given!(:question) { create(:question, author: user) }
  given!(:answer) { create(:answer, question: question, author: user )}

  scenario 'Unauthenticated user tryes to edit answer' do
    visit question_path(question)

    expect(page).to_not have_link 'Edit'

  end

  describe 'Authenticated user' do
    before  do
      sign_in user
      visit question_path(question)
    end

    scenario 'sees link to edit on his answer' do
      within '.answers' do
        expect(page).to have_link 'Edit'
      end
    end

    scenario 'tries to edit other users answer' do
      click_on 'Edit'
      within '.asnwers' do
        fill_in 'Answer', with: 'edited answer'
        click_on 'Save'
      end
      expect(page).to_not have_content answer.body
      expect(page).to have_content 'edited answer'
      expect(page).to_not have_selector 'textarea'
    end

  end


  end