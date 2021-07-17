require "spec_helper"

describe Category, type: :model do
  it { is_expected.to have_and_belong_to_many(:photos) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:slug) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_uniqueness_of(:slug) }

  let(:category) { create(:category, name: "A Test Category") }

  it "should have a slug generated from name" do
    expect(category.slug).to eql("a-test-category")
  end
end
