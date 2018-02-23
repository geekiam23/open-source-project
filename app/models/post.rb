require 'elasticsearch/model'
class Post < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :user
  belongs_to :content, polymorphic: true

  validates :user, presence: true

  delegate :username, to: :user


  # settings index: { number_of_shards: 1 } do
  #   mappings dynamic: 'false' do
  #     # indexes :id,                  :type => 'integer', :index    => :not_analyzed
  #
  #     # indexes :text_post do
  #     #   # indexes :id,                  :type => 'keyword'
  #     #   indexes :body,                  :type => 'text', :analyzer => 'snowball'
  #     # end
  #     #
  #     # indexes :pic_post do
  #     #   # indexes :id,                  :type => 'keyword'
  #     #   indexes :image_file_name,     :type => 'text', :analyzer => 'snowball'
  #     # end
  #   end
  # end
end
