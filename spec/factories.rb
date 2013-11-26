FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{ n }@example.com" }
    password "foobarfoobar"
  end
end
