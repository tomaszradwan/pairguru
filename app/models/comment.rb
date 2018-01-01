# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  content      :text
#  user_id      :integer
#  user_name    :string
#  movie_id     :integer
#  created_at   :datetime
#  updated_at   :datetime

class Comment < ApplicationRecord
    validates :content, length: { minimum: 2 }
    validates :user_id, length: { minimum: 1 }
    validates :user_name, length: { minimum: 1 }
    validates :movie_id, length: { minimum: 1 }
    belongs_to :user
    belongs_to :movie
end
