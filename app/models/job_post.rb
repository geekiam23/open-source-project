class JobPost < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  acts_as_taggable_on :tags

  def tag_list
    self.tags.map(&:name).join(', ')
  end
end

# Delete the previous Posts index in Elasticsearch
JobPost.__elasticsearch__.client.indices.delete index: JobPost.index_name rescue nil

# Create the new index with the new mapping
JobPost.__elasticsearch__.client.indices.create \
  index: JobPost.index_name,
  body: { settings: JobPost.settings.to_hash, mappings: JobPost.mappings.to_hash }

# Index all Post records from the DB to Elasticsearch
JobPost.import
