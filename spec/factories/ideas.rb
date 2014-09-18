require 'factory_girl'

FactoryGirl.define do
  factory :idea do  |item|
    item.id 1
    item.title 'Nuclear bomb'
    item.description 'Big badaboom'
    item.user_id 1
    item.rate 4.5
  end
  factory :idea_without_rate, class: Idea do
    id 2
    title "New Idea"
    description "Short Description"
    user_id 1
  end
end