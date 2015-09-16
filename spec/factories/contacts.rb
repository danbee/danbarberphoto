# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    email 'test@danbarberphoto.com'
    name 'Dan Barber'
    message 'This is a message.'
  end
end
