require "elasticsearch/model"

# module Searchable
#   extend ActiveSupport::Concern
#
#   included do
#     include Elasticsearch::Model
#
#     after_commit do
#       __elasticsearch__.index_document
#     end
#   end
# end

class PicPost < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_attached_file :image, styles: { thumb: "200x200" }

  validates_attachment :image,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png" ]},
    size: { in: 0..10.megabytes },
    presence: true
end

# Delete the previous Posts index in Elasticsearch
PicPost.__elasticsearch__.client.indices.delete index: PicPost.index_name rescue nil

# Create the new index with the new mapping
PicPost.__elasticsearch__.client.indices.create \
  index: PicPost.index_name,
  body: { settings: PicPost.settings.to_hash, mappings: PicPost.mappings.to_hash }

# Index all Post records from the DB to Elasticsearch
PicPost.import
