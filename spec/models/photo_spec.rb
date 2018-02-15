require "spec_helper"

describe Photo do
  it { should have_and_belong_to_many(:categories) }

  it { should validate_presence_of(:image) }

  let(:photo) { create(:photo) }

  it "logs a view" do
    expect { photo.log_view }.to change { photo.views }.by(1)
  end
end
