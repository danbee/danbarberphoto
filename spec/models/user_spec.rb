require "spec_helper"

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password_digest) }

  it "validates uniqueness of email" do
    create(:user, email: "test@example.com")
    user = User.new(email: "test@example.com")

    expect(user).to validate_uniqueness_of(:email)
  end
end
