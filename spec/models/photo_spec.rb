require 'spec_helper'

describe Photo do
  it { should have_and_belong_to_many(:categories) }

  let(:photo) { create(:photo) }

  it "logs a view" do
    expect { photo.log_view }.to change{photo.views}.by(1)
  end
end
