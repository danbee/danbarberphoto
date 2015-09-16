# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    title 'A Photo'
    description 'A lovely photo of a tree'
    image Rails.root.join('spec/fixtures/photo.jpg')
  end
end
