class CreatePostForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attribute :title, :string
  attribute :body, :string
  attribute :author_name, :string

  validates :title, presence: true
  validates :body, presence: true
  validates :author_name, presence: true

end