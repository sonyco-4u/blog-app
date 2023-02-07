require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Omar') }
  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not(be_valid)
  end

  it "shouldn't have any recent posts" do
    expect(subject.most_recent_posts.length).to eq(0)
  end

  it 'should have a positive posts counter' do
    subject.posts_counter = -1
    expect(subject).to_not(be_valid)
  end
end
