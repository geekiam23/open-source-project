require "elasticsearch/model"

class TextPost < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates :body, presence: true, length: { in: 1..256 }
end

# # Delete the previous Posts index in Elasticsearch
# TextPost.__elasticsearch__.client.indices.delete index: TextPost.index_name rescue nil
#
# # Create the new index with the new mapping
# TextPost.__elasticsearch__.client.indices.create \
#   index: TextPost.index_name,
#   body: { settings: TextPost.settings.to_hash, mappings: TextPost.mappings.to_hash }
#
# # Index all Post records from the DB to Elasticsearch
# TextPost.import
