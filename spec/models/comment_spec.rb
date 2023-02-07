require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(text: 'Hello World') }
  before { subject.save }

  it 'comment_counter method should raise error without post' do
    expect { subject.comment_counter }.to raise_error(NoMethodError)
  end
end
