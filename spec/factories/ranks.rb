require 'factory_girl'

FactoryGirl.define do
  factory :rank do |r|
    r.sequence(:id) {|n| n}
    r.name ''
  end
end