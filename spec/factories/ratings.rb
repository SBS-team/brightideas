require 'factory_girl'

FactoryGirl.define do
  factory :rating do
    idea_id 1
    user_id 2
    rate 2.2
  end
end