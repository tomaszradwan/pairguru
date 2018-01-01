require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  subject {
    Comment.new(content: "Lorem ipsum", user_id: 2, movie_id: 3, user_name: 'Tomek')
  }

  it "is not valid without a user_id" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a content" do
    subject.content = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with a content length eq. 1 character" do
    subject.content = 'x'
    expect(subject).to_not be_valid
  end

  it "is not valid without a user_name" do
    subject.user_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a movie_id" do
    subject.movie_id = nil
    expect(subject).to_not be_valid
  end

  it "is valid with a movie_id" do
    subject.movie_id = 56789
    expect(subject).to be_valid
  end

  it "is valid with a user_id" do
    subject.user_id = 12345
    expect(subject).to be_valid
  end

  it "is valid with a user_name" do
    subject.user_name = 'Test User Name'
    expect(subject).to be_valid
  end

  it "is valid with a content length eq. 2 character" do
    subject.content = 'OK'
    expect(subject).to be_valid
  end
end
