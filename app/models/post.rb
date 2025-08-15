class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  attribute :author_name, :string

  belongs_to :user
end
