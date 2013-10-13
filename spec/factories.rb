FactoryGirl.define do
  factory :admin do
    username 'abc123'
    password 'abc123'
    password_confirmation 'abc123'
  end

  factory :entry do
    name 'abc123'
    email 'abc123'
    phone 'abc123'
    description 'abc123'
  end
end
