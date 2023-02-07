require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Post title', text: 'First post', author_id: 2, comments_counter: 0, likes_counter: 0) }
  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not(be_valid)
  end

  it "title shouldn't exceed 250 character" do
    subject.title = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.
    Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.
    Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec.'
    expect(subject).to_not(be_valid)
  end

  it 'post_counter method should raise an error without user' do
    expect { subject.post_counter }.to raise_error(NoMethodError)
  end

  it 'should have positive comments counter' do
    subject.comments_counter = -1
    expect(subject).to_not(be_valid)
  end

  it 'should have positive likes counter' do
    subject.likes_counter = -1
    expect(subject).to_not(be_valid)
  end

  it "shouldn't be any comments exists" do
    expect(subject.most_recent_comments.length).to eq(0)
  end
end
