require 'factory_girl'

FactoryGirl.define do
  factory :developer, class: Rank do
    id 1
    name 'developer'
  end
  factory :manager, class: Rank do
    id 2
    name 'manager'
  end
end