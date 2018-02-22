class PicPost < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_attached_file :image, styles: { thumb: "200x200" }

  validates_attachment :image,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png" ]},
    size: { in: 0..10.megabytes },
    presence: true
end
