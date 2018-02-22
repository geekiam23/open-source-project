class TextPost < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates :body, presence: true, length: { in: 1..256 }
end
