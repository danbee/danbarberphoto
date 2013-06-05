require 'spec_helper'

describe Contact do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:message) }

  it { should allow_value("test@test.com").for(:email) }
  it { should_not allow_value("test@test").for(:email) }
end
