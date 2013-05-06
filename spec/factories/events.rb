# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "title"
    category "category"
    duration 100
    description "description"
  end
end
