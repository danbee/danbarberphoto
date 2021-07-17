require "spec_helper"

describe Contact, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:message) }

  it { is_expected.to allow_value("test@test.com").for(:email) }
  it { is_expected.not_to allow_value("test@test").for(:email) }

  let(:contact) { build(:contact) }
end
