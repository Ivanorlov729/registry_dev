# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription do
    luxe_registry nil
    subscribe false
  end
end
