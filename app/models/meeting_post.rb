class MeetingPost < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  acts_as_taggable_on :tags

  def tag_list
    self.tags.map(&:name).join(', ')
  end
end

# Delete the previous Posts index in Elasticsearch
MeetingPost.__elasticsearch__.client.indices.delete index: MeetingPost.index_name rescue nil

# Create the new index with the new mapping
MeetingPost.__elasticsearch__.client.indices.create \
  index: MeetingPost.index_name,
  body: { settings: MeetingPost.settings.to_hash, mappings: MeetingPost.mappings.to_hash }

# Index all Post records from the DB to Elasticsearch
MeetingPost.import
