# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_detail do
    user nil
    first_name "MyString"
    last_name "MyString"
    zip_code "MyString"
  end
end
