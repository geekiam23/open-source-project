require "elasticsearch/model"

class ProjectPost < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  acts_as_taggable_on :tags

  def tag_list
    self.tags.map(&:name).join(', ')
  end
end

# Delete the previous Posts index in Elasticsearch
ProjectPost.__elasticsearch__.client.indices.delete index: ProjectPost.index_name rescue nil

# Create the new index with the new mapping
ProjectPost.__elasticsearch__.client.indices.create \
  index: ProjectPost.index_name,
  body: { settings: ProjectPost.settings.to_hash, mappings: ProjectPost.mappings.to_hash }

# Index all Post records from the DB to Elasticsearch
ProjectPost.import
