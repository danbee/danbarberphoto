require 'spec_helper'

describe Contact do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:message) }

  it { should allow_value("test@test.com").for(:email) }
  it { should_not allow_value("test@test").for(:email) }

  let(:contact) { build(:contact) }

  it "should send an email" do
    contact.save
    expect(ActionMailer::Base.deliveries.last.from).to eql([contact.email])
    expect(ActionMailer::Base.deliveries.last.to).to eql(['enquiries@danbarberphoto.com'])
  end
end
