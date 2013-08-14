# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :luxe_registry do
    event nil
    event_date "2013-08-13"
    first_name "MyString"
    last_name "MyString"
    phone "MyString"
  end
end
