require 'factory_girl'

FactoryGirl.define do
  factory :idea do
    id 1
    title "New Idea"
    description "Short Description"
    user_id 2
    rate 2.34
  end

  factory :idea_without_rate, class: Idea do
    id 2
    title "New Idea"
    description "Short Description"
    user_id 2
  end
end