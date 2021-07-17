FactoryBot.define do
  factory :photo do
    title { "A Photo" }
    description { "A lovely photo of a tree" }
    image { Rails.root.join("spec/fixtures/photo.jpg") }
  end
end
