require 'elasticsearch/model'

class Post < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  acts_as_taggable_on :tags

  belongs_to :user
  belongs_to :content, polymorphic: true

  validates :user, presence: true

  delegate :username, to: :user

  def tag_list
    self.taggings.map(&:name)
  end
end
