require 'elasticsearch/model'

class Post < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :user
  belongs_to :content, polymorphic: true

  validates :user, presence: true

  delegate :username, to: :user

end
