FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end

  factory :user do
    email 'user@example.com'
    password 'foobar'
    password_confirmation 'foobar'
  end

  factory :invalid_user , class: 'User' do
    email nil
    password nil
  end
end
