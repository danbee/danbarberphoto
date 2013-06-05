require 'spec_helper'

describe Category do
  it { should have_and_belong_to_many(:photos) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:slug) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:slug) }

  let(:category) { create(:category, name: "A Test Category") }

  it "should have a slug generated from name" do
    expect(category.slug).to eql("a-test-category")
  end
end
