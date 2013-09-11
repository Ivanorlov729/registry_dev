# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_product, :class => 'OrderProducts' do
    order nil
    offer nil
  end
end
