require 'factory_girl'

FactoryGirl.define do
  factory :office do |o|
    o.sequence(:id) {|n| n}
    o.sequence(:number) {|n| n}
  end
end