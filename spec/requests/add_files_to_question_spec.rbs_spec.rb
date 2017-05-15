require 'rails_helper'

RSpec.describe "AddFilesToQuestionSpec.rbs", type: :request do
  feature 'Add files to question' do
    given(:user) { create(:user) }

    background do
      sign_in(user)
    end
  end
end
