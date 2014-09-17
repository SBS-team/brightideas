require 'factory_girl'

FactoryGirl.define do
  factory :manager, class: Rank do
    id 1
    name 'manager'
  end
  factory :developer, class: Rank do
    id 2
    name 'developer'
  end
end