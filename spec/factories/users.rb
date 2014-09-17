require 'factory_girl'

FactoryGirl.define do
  factory :admin do
    id 1
    email "angry_admin@mail.com"
    password "12345678"
    password_confirmation "12345678"
    last_name "user"
    first_name "huser"
    office_id  1
    rank_id 1
    avatar File.open(File.join(Rails.root, '/app/assets/images/file.gif'))
  end

  factory :user do
    id 2
    email "user@mail.com"
    password "12345678"
    password_confirmation "12345678"
    last_name "vasya"
    first_name "dron"
    office_id  1
    rank_id 2
    avatar File.open(File.join(Rails.root, '/app/assets/images/file.gif'))
  end
end