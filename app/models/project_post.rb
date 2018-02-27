require "elasticsearch/model"

class ProjectPost < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

end
