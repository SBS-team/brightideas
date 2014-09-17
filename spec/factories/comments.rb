require 'factory_girl'

FactoryGirl.define do
  factory :comment do
    id 1
    text "Short Description"
    user_id 2
    idea_id 1
  end
end