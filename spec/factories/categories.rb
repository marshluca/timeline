# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    name "MyString"
    count 1
    slug "MyString"
    postion 1
    subcates []
  end
end
