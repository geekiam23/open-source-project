class MeetingPost < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  acts_as_taggable_on :tags

  def tag_list
    self.tags.map(&:name).join(', ')
  end
end
