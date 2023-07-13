require 'rails_helper'

RSpec.describe Post, type: :model do
  subject{ Post.new(Title: 'This is a post', CommentsCounter: 2, LikesCounter: 1) }

  before {subject.save}

  it 'Title should be present' do
    subject.Title = nil
    expect(subject).to_not be_valid
  end

  it 'Title must not exceed 250 characters' do
    subject.Title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter should be greater than or equal to 0' do
    subject.CommentsCounter = -1
    expect(subject).to_not be_valid
  end

  it 'LikesCounter should be greater than or equal to 0' do
    subject.LikesCounter = -1
    expect(subject).to_not be_valid
  end

end
